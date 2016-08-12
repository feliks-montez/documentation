# Ubuntu Tricks

## Disable Grub

Edit ```/etc/default/grub``` as root and change ```GRUB_TIMEOUT``` to be equal to ```0```. Save and reboot.
You can still use grub by holding shift while rebooting. Make sure you run ```sudo update-grub``` to update ```/boot/grub/grub.cfg```.

## Change Grub Default

### Backup Settings
Copy the settings file:
```bash
sudo cp /boot/grub/menu.lst /boot/grub/menu.lst_backup
```

### Edit Settings
Open ```/boot/grub/menu.lst```:
```bash
gksudo gedit /boot/grub/menu.lst
```
Find the line that says ```default  0``` and change ```0``` to the number of the item you want as the new default.

### If /boot/grub/menu.lst Doesn't exist
Grub2 doesn't use this file. Insead, modify ```/etc/grub.d/40_custom``` instead.
Look at the (Grub documentation)[https://help.ubuntu.com/community/Grub2] for more info on Grub2. Here's the page for (custom menus)[https://help.ubuntu.com/community/Grub2/CustomMenus].
