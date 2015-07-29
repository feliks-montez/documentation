# Networking Tips

## Cloning Machines

### Fix networking errors
Run this command before cloning (after works too):
```bash
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
sudo ifconfig eth0 inet 192.168.1.XXX
sudo dhclient eth0
```
Add the following to `/etc/network/interfaces`:
```
auto eth0
iface eth0 inet dhcp
```
and reboot.
