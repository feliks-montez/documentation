# Clustering tips
## Passworless SSH
Install sshpass:
```bash
sudo apt-get install sshpass -y
```
Create this script as `ssh-distrib.sh`:
```bash
#!/bin/sh

# remove following remark if you want to generate new key on source machine - not recommended!
# ssh-keygen -t rsa

count=1
until [ "$*" = "" ]
do
  sshpass -p 'server' ssh hduser@$1 'mkdir -p ~/.ssh'
  cat ~/.ssh/id_rsa.pub | sshpass -p 'server' ssh hduser@$1 'cat >> ~/.ssh/authorized_keys'

  shift
  count=`expr $count + 1`

done
```
Make sure to change the username and password to that of your host machines, then run
```bash
chmod +x ssh-distrib.sh
```
 on the script. Run the script like so:
```bash
./ssh-distrib.sh host1 host2 host3 ...
```
