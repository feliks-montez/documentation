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

## Setting up local DNS

Edit `/etc/resolveconf/resolv.conf.d/base` to permenantly update `/etc/resolv.conf`.

### Allow dynamic use of hostnames
Add your gateway (router) as a nameserver.
```bash
nameserver 127.0.0.1
```

### When *.local names are not resolved
1. Install ```avahi-dnsconfd```

 ```bash
 sudo apt-get install avahi-daemon avahi-dnsconfd avahi-discover avahi-utils
 ```
 ```avahi-dnsconfd``` listens to the publishing and passes them to ```resolvconf```.

2. Install ```libnss-mdns``` (This library was missing, Installing it fixed the problem in this case)
 ```bash
 sudo apt-get install libnss-mdns
 ```
 ```nss-mdns``` is a plugin for the GNU Name Service Switch (NSS) functionality of the GNU C Library (glibc) providing host name resolution via Multicast DNS (using Zeroconf, aka Apple Bonjour / Apple Rendezvous ), effectively allowing name resolution by common Unix/Linux programs in the ad-hoc mDNS domain .local

3. Check ```/etc/nsswitch.conf```

 hosts:     ```files mdns4_minimal dns [NOTFOUND=return] mdns4```

 It should have ```mdns4_minimal``` or ```mdns4``` before ```[NOTFOUND=return]``` and before ```dns``` if you have a DNS server that configured resolve ```*.local```.

4. Reboot

### Reverse IP lookup using Avahi
```bash
getent hosts 192.168.x.x
```

### Set up DNS server with BIND9
Follow [this](https://wiki.debian.org/Bind9) guide.

### Set up DHCP server with isc-dhcp-server
Follow [this](https://wiki.debian.org/DHCP_Server) guide.

### Set up Dynamic DNS with nsupdate and bind
Follow [this](https://wiki.debian.org/DDNS) guide.

### Set up DNSSEC on an authoritative BIND DNS server
When you install bind9, ```sudo apt-get install bind9```, it will automatically install ```dnssec-keygen```.

[Here](https://www.digitalocean.com/community/tutorials/how-to-setup-dnssec-on-an-authoritative-bind-dns-server--2) is an article that details the process.

### Configure network to use your DNS servers
In ```/etc/dhcp/dhclient.conf``` uncomment the
```bash
perpend domain-name-servers 127.0.0.1
```
line and add in the addresses of your DNS servers. Then remove ```domain-name-servers``` from the list in the next line (```request```).
