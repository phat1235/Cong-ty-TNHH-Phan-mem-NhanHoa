
```When I started my laptop I found this message:

Welcome to emergency mode! After logging in,type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D
to try again to boot into default mode.
Give root password for maintainence
(or type control-D to continue):
```
---
```
When you see Ctrl+D enter root password. Then run mount -a to see where the error is (which line).

Then enter sudoedit /etc/fstab and correct the missing or remove it, then save and finally reboot with sudo reboot.
```
