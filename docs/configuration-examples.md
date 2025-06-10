---
outline: deep
---

# Configuration Examples

This page provides examples of how to configure WireKCP for various use cases. The examples are designed to help you quickly set up and customize your WireKCP installation.

## Server Configuration 
### Interface Configuration

```
IPv4 = 192.168.110.1/24
ListenPort = 49200
PrivateKey = "QGb8cQWkoiKY+8GjKuQ1aE6pIKQHqzLsgFH9ZaIlDXY="
```

### Peer Configuration

```
[Peer]
PublicKey = "R/lJE5FchSC/gLm4+uX89HOZf5wpqd2vmNgLSghORFI="
Endpoint = "peer_endpoint_here:54820"
AllowedIPs = "<remote_IPv4>/32, 192.168.110.2/32"
```

## Client Configuration

### Interface Configuration
```
IPv4 = 192.168.110.2/24
ListenPort = 54820
PrivateKey = "wP5dQza7gS1qIQDYOiWWYP+ip1qxVqHvPFAkv0Bb0FA="
```

### Peer Configuration
```
PublicKey = "VxtT16NTfjc7FvS8KQdeXHPIdj+37ZcetUqD/9QAwGs="
Endpoint = "server_ip_here:49200"
AllowedIPs = "<remote_IPv4>/32, 192.168.110.1/32"
```