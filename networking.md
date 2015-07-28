# Networking Tips

## Cloning Machines

### Fix networking errors
run this command before cloning (after works too):
```bash
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
```
