# Flipper Zero U2F + Firefox Snap

Adds a udev rule for Flipper Zero U2F security key so that Firefox installed as a snap can access the key.

- Tested on Ubuntu 22.04 with Firefox installed as a snap with a Flipper Zero

## Running

```shell
# Backup your existing udev rule
cp /etc/udev/rules.d/70-snap.firefox.rules ~/70-snap.firefox.rules.bak

# Script will ask for password if not running as root
./add-flipper-u2f-udev-rule.bash

# Reload AppArmor
sudo systemctl reload apparmor.service

# Connect U2F device to Firefox snap
sudo snap connect firefox:u2f-devices
```

You may need to unplug and plug in your Flipper Zero and restart Firefox before it is recognized.

Optionally, add to crontab run snap connect on reboot.

```shell
sudo crontab -e

# Add inside crontab editor and save
@reboot /usr/bin/snap connect firefox:u2f-devices
```
