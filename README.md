# dotfiles

This is explained in his [Blog Post](https://dev.to/jameson/bash-completion-for-git-on-mac-os-x-monterrey-3imd)

Jameson's . (dot) files for UNIX and Linux family command-line
environments.

One goal of these dot files is to converge on a similar experience
across some different UNIX/Linux systems that we encounter in the wild:

* Ubuntu
* Debian
* RHEL
* Amazon Linux
* Mac OS X
* etc.

## Configuration

Edit the following as needed

* **bashrc-common**
* **bashrc-linux-samson**
* **bashrc-mac-m2**
* **ps1-k8s**

When done run the following command

```bash
~/github/tonygilkerson/dotfiles/install.sh
```

## Manual Stuff

### iTerm 

Add in iTerm2 the following Profile Shortcut Keys, [ref](https://stackoverflow.com/questions/6205157/how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line)

| FOR | ACTION          | SEND |
| --- | --------------- | ---- |
| ⌘ ← | "SEND HEX CODE" | 0x01 |
| ⌘ → | "SEND HEX CODE" | 0x05 |

### GNOME Tweeks

Trying to make my Linux and Mac workstations use the same keys for copy/past

* Open `GNOME Tweaks`
* Select `Keyboard & Mouse` in left nav
* In the `Overview Shortcut` section
  * `Left Super` is the default
  * Select `Right Super`
* In the `Additional Layout Option` section
  * under `Alt/Win key behavior`
    * Disabled is the default
    * Select `Ctrl is mapped to Win and the usual Ctrl keys`
    * Then in `settings->keyboard`
    * Set `Show the overview` to `Ctrl+Space`
    * Set `Switch applications` to `Ctrl+Tab`
    * Set `Switch windows of an application to `Ctrl+Tick`
    * NOTE: In the above `Ctrl+key` is really `Command+key` on the physical keyboard due to the swapping of Ctrl with Win!
  