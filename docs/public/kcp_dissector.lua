-- create protocol
kcp_protocol = Proto("KCP",  "KCP Protocol")

-- fields for kcp
conv = ProtoField.uint32("kcp.conv", "conv", base.DEC)
cmd = ProtoField.uint8("kcp.cmd", "cmd", base.DEC)
frg = ProtoField.uint8("kcp.frg", "frg", base.DEC)
wnd = ProtoField.uint16("kcp.wnd", "wnd", base.DEC)
ts = ProtoField.uint32("kcp.ts", "ts", base.DEC)
sn = ProtoField.uint32("kcp.sn", "sn", base.DEC)
una = ProtoField.uint32("kcp.una", "una", base.DEC)
len = ProtoField.uint32("kcp.len", "len", base.DEC)
content = ProtoField.bytes("kcp.content", "Data")

kcp_protocol.fields = {conv, cmd, frg, wnd, ts, sn, una, len, content}

-- dissect each udp packet
function kcp_protocol.dissector(buffer, pinfo, tree)
  length = buffer:len()
  if length == 0 then return end

  local offset = 0

  local first_sn = buffer(offset+12, 4):le_int()
  local first_len = buffer(offset+20, 4):le_int()
  local first_cmd_name = get_cmd_name(buffer(offset+4, 1):le_int())
  local info = string.format("[%s] Sn=%d Kcplen=%d", first_cmd_name, first_sn, first_len)

  pinfo.cols.protocol = kcp_protocol.name
  udp_info = string.gsub(tostring(pinfo.cols.info), "Len", "Udplen", 1)
  pinfo.cols.info = string.gsub(udp_info, " U", info .. " U", 1)

  -- dssect multi kcp packet in udp
  while offset < buffer:len() do
      local conv_buf = buffer(offset+0, 4)
      local wnd_buf = buffer(offset+6, 2)
      local cmd_buf = buffer(offset+4, 1)
      local sn_buf = buffer(offset+12, 4)
      local len_buf = buffer(offset+20, 4)

      local cmd_name = get_cmd_name(cmd_buf:le_int())
      local data_len = len_buf:le_int()
      local data_buf = buffer(offset+24, data_len)

      local tree_title = string.format("KCP Protocol, %s, Sn: %d, Conv: %d, Wnd: %d, Len: %d",
            cmd_name, sn_buf:le_int(), conv_buf:le_uint(), wnd_buf:le_int(), data_len)
      local subtree = tree:add(kcp_protocol, buffer(), tree_title)
      subtree:add_le(conv, conv_buf)
      subtree:add_le(cmd, cmd_buf):append_text(" ("..cmd_name..")")
      subtree:add_le(frg, buffer(offset+5, 1))
      subtree:add_le(wnd, wnd_buf)
      subtree:add_le(ts, buffer(offset+8, 4))
      subtree:add_le(sn, sn_buf)
      subtree:add_le(una, buffer(offset+16, 4))
      subtree:add_le(len, len_buf)
      if data_len > 0 then
          local content_subtree = subtree:add(content, data_buf)
          content_subtree:set_text(string.format("Data Len ("..data_len .." bytes)"))
          content_subtree:add_le(data_buf, string.format("Data: %s", bytes_to_string(data_buf)))
      end
      if wireguard_check(data_buf) then
          Dissector.get("wg"):call(data_buf:tvb(), pinfo, tree)
      end
      offset = offset + 24 + data_len
  end
end

function get_cmd_name(cmd_val)
    if cmd_val == 81 then
        return "PSH"
    elseif cmd_val == 82 then
        return "ACK"
    elseif cmd_val == 83 then
        return "ASK"
    elseif cmd_val == 84 then
        return "TELL"
    end
end

function bytes_to_string(buffer)
    local str = ""
    for i = 0, buffer:len()-1, 1 do
        local char = buffer(i, 1):uint()
        if char >= 32 and char <= 126 then
            str = str .. string.char(char)
        else
            str = str .. "."
        end
    end
    return str
end

function wireguard_check(buffer)
    if buffer:len() >= 4 and buffer(0, 1):le_int() >= 1 and buffer(0, 1):le_int() <= 4 and buffer(1, 1):le_int() == 0 and buffer(2, 2):le_int() == 0 then
        return true
    end
    return false
end

-- -- register kcp dissector to udp
-- local udp_port = DissectorTable.get("udp.port")
-- udp_port:add(51820, kcp_protocol)
kcp_protocol:register_heuristic("udp", function(buffer, pinfo, tree)
    if buffer:len() >= 24 then
        local cmd_val = buffer(4, 1):le_int()
        if cmd_val == 81 or cmd_val == 82 or cmd_val == 83 or cmd_val == 84 then
            kcp_protocol.dissector(buffer, pinfo, tree)
            return true
        end
    end
    return false
end)