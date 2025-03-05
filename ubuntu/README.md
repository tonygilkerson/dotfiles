# Ubuntu

ref: [how to](https://askubuntu.com/questions/16371/how-do-i-disable-x-at-boot-time-so-that-the-system-boots-in-text-mode)

```sh
#
# Look at current setting
#
sudo systemctl get-default
graphical.target

#
# Set to text mode
#
sudo systemctl set-default multi-user.target

#
# Show day of week in date shown at the top of my desktop
#

# Look at current settings
gsettings list-recursively org.gnome.desktop.interface

# Set the "clock-show-weekday" to "true" by running this command:
gsettings set org.gnome.desktop.interface clock-show-weekday true
```

You will still be able to use X by typing `startx` after you logged in