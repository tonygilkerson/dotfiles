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

* **.bashrc.darwin** - Edit this file, if on a Mac it will get sourced in your `.bashrc` file
* **.bashrc.ps1** - Edit this file to set your bash prompt

When done run the following:

```bash
~/github/dotfiles/install.sh
```

## Manual Stuff

Add in iTerm2 the following Profile Shortcut Keys, [ref](https://stackoverflow.com/questions/6205157/how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line)

FOR | ACTION          | SEND
----|-----------------|------
⌘ ←	| "SEND HEX CODE"	| 0x01
⌘ →	| "SEND HEX CODE"	| 0x05
