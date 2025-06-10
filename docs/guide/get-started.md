---
outline: deep
---
# Getting Started 

## Installation
### Windows
To get started with WireKCP, you need to install it. You need to download the WireKCP
binary from the [WireKCP releases page](https://github.com/wirekcp/wirekcp/releases/latest)

1. Download the latest installer from the releases page or click [here](https://github.com/wirekcp/wirekcp/releases/latest/download/WireKCP-Installer-Setup-x86_64.exe) to download the installer directly.
2. Run the installer and follow the instructions.

### Linux
1. Download the latest binary from the releases page or click [here](https://github.com/wirekcp/wirekcp/releases/latest/download/wirekcp_linux_amd64.deb) to download the binary directly.
2. Open a terminal and navigate to the directory where you downloaded the binary.
3. Run the following command to install WireKCP:
   ```bash
   sudo apt install ./wirekcp_linux_amd64.deb
   ```

## Up and Running
### Windows
1. After installing WireKCP, you can start using it by running the following command:
   ```cmd
   wirekcp up
   ```
2. Once **Firewall pops up**, click on **"Allow access"** to allow WireKCP to communicate through the firewall.
3. To check the status of WireKCP, you can run:
   ```cmd
   wirekcp service install
   ```
4. To start the service, run:
   ```cmd
   wirekcp service start
   ```
5. Now you can configure your tunnel interface using the command line. 
   ```cmd
   wirekcp config
   ```
6. For configuration, you may refer to the [Configuration Sample](/configuration-examples).

### Linux
1. After installing WireKCP, you can start using it by running the following command in your terminal with as **root**:
   ```bash
   wirekcp service install
   ```
2. Once the service is installed, you can start it with:
   ```bash
   wirekcp service start
   ```
3. To check the status of the service, you can use:
   ```bash
   service wirekcp status
   ```
4. Now you can configure your tunnel interface using the command line. 
   ```bash
   wirekcp config
   ```
5. For configuration, you may refer to the [Configuration Sample](/configuration-examples).

## Next Steps
Now you have your own VPN connection up and running. You can start using it to ping your devices within your network.

### Example
To test your connection, you can use the `ping` command to check connectivity to a device in your network. For example:
```bash
ping <remote-tunnel-ip>
```
Replace `<remote-tunnel-ip>` with the IP address of the device you want to ping.