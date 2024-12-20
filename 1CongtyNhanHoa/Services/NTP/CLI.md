# Chrony CLI simple for Ubuntu 

Chrony is a versatile implementation of the Network Time Protocol (NTP) designed to keep system time synchronized.

---
## Installation and Setup

1. **Install Chrony**:
   ```bash
   sudo apt update
   sudo apt install chrony -y
   ```

2. **Enable and Start Chrony**:
   ```bash
   sudo systemctl enable chrony
   sudo systemctl start chrony
   ```

3. **Check Chrony Status**:
   ```bash
   sudo systemctl status chrony
   ```

---
## Configuration

1. **Edit Configuration File**:
   Configuration is in `/etc/chrony/chrony.conf`.
   ```bash
   sudo nano /etc/chrony/chrony.conf
   ```

2. **Add NTP Servers**:
   Replace or add servers:
   ```text
   server <ntp-server> iburst
   ```
   Example:
   ```text
   server 0.ubuntu.pool.ntp.org iburst
   server 1.ubuntu.pool.ntp.org iburst
   server 2.ubuntu.pool.ntp.org iburst
   ```

3. **Restart Chrony**:
   After modifying configuration, restart the service:
   ```bash
   sudo systemctl restart chrony
   ```

---
## Common Commands

1. **Check Synchronization**:
   ```bash
   chronyc tracking
   ```

2. **List NTP Servers**:
   ```bash
   chronyc sources
   ```

3. **Detailed Source Info**:
   ```bash
   chronyc sourcestats
   ```

4. **Force Synchronization**:
   ```bash
   sudo chronyc -a makestep
   ```

5. **Monitor Logs**:
   ```bash
   sudo journalctl -u chrony
   ```

---
## Useful Configuration Options

1. **Specify Time Servers**:
   ```text
   server <ntp-server> iburst
   ```

2. **Allow Specific Networks**:
   Allow clients from specific subnets:
   ```text
   allow 192.168.1.0/24
   ```

3. **Local Hardware Clock**:
   Use the local clock as a fallback:
   ```text
   local stratum 10
   ```

4. **Log Statistics**:
   Enable logging:
   ```text
   log measurements statistics tracking
   ```

---
## Debugging

1. **Verify Time Sync**:
   ```bash
   timedatectl
   ```

2. **Check Network Connectivity to NTP Server**:
   ```bash
   ping <ntp-server>
   ```

3. **Manually Check Offset**:
   ```bash
   chronyc ntpdata
   ```

4. **Increase Verbosity**:
   Run Chrony in debug mode:
   ```bash
   sudo chronyd -d
   ```

---
## Uninstall Chrony

1. **Stop Chrony**:
   ```bash
   sudo systemctl stop chrony
   ```

2. **Remove Chrony**:
   ```bash
   sudo apt remove chrony -y
   ```

3. **Clean Configuration**:
   ```bash
   sudo rm -rf /etc/chrony
   ```

