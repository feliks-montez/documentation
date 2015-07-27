# pcDuino Tips

## Create bootable SD card clone
```bash
sudo board-config.sh
```
-> make_mmc_boot
"do you want to clone?" -> yes
"do you want to format?" -> yes
"clone succeeded" -> ok
  
```bash
df -h
```
look for size of /dev/mmcblk0p2 and if less than size of SD card, run: 
```bash
wget https://s3.amazonaws.com/pcduino/SampleCode/System/expandFS/expand_sdcard_rootfs.sh
sudo bash ./expand_sdcard_rootfs.sh
sudo reboot
sudo resize2fs /dev/mmcblk0p2
df -h
```
again, check size of /dev/mmcblk0p2 and repeat if nessessary

# Install Java
```bash
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
sudo apt-get update
sudo apt-get install oracle-java8-installer
```
