#!/bin/sh

# I have an issue with my system where an old hard drive with Windows is not
# detected by GRUB. This script sets that hard drive to boot the next time
# the compute boots up and reboots the system.
sudo efibootmgr -n 0000 && systemctl reboot
