# Additional Resources

## Wireshark Packet Dissector
- For KCP protocol analysis, you can use the Wireshark dissector available at [Wireshark KCP Dissector](https://wirekcp.github.io/docs/kcp_dissector.lua).
- This Lua script can be used to dissect KCP packets in Wireshark, providing insights into the protocol's behavior and performance.
- For KCP protocol with FEC (Forward Error Correction), you can use the [Wireshark KCP FEC Dissector](https://wirekcp.github.io/docs/kcp_fec_dissector.lua).
- This script extends the KCP dissector to handle FEC packets, allowing for detailed analysis of error correction mechanisms in KCP.

## How to Use the Dissector
1. Download the Lua script from the provided links.
2. Copy/Cut the script to your Wireshark plugins directory. The default path is usually:
   - **Windows**: `C:\Program Files\Wireshark\plugins` or `%APPDATA%\Wireshark\plugins`
   - **Linux**: `~/.local/lib/wireshark/plugins/` or `/usr/lib/x86_64-linux-gnu/wireshark/plugins/`
   - **macOS**: `INSTALLDIR/lib/wireshark/plugins` or `%APPDIR%\Contents\PlugIns\`
3. Restart Wireshark to load the new dissector.

## Reference
1. [Wireshark Plugin Path](https://www.wireshark.org/docs/wsug_html_chunked/ChPluginFolders.html) 