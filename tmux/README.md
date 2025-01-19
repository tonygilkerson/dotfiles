# tmux

```sh
# Start tmux in your terminal.
tmux
```

Enter tmux's command mode by pressing `Ctrl+b` followed by `:`

| Key Binding       | Description                     |
| ----------------- | ------------------------------- |
| Ctrl + b %        | Create a new pane horizontally  |
| Ctrl + b "        | Create a new pane vertically.   |
| Ctrl + b →        | Move to the pane to the right.  |
| Ctrl + b ←        | Move to the pane to the left.   |
| Ctrl + b ↑        | Move to the pane above.         |
| Ctrl + b ↓        | Move to the pane below.         |
| Ctrl + b o        | Switch to the next pane.        |
| Ctrl + b ;        | Switch to the last active pane. |
| Ctrl + b 0-9      | Switch to pane number 0-9.      |
| Ctrl + b x        | Close the current pane.         |
| Ctrl + b {        | Move the current pane left.     |
| Ctrl + b }        | Move the current pane right.    |
| Ctrl + b z        | Toggle pane zoom (fullscreen).  |
| Ctrl + b !        | Convert pane into a window.     |
| Ctrl + b Spacebar | Toggle between pane layouts.    |

NOTE: With mouse mode `on` you can right-click to get a popup window with pane options

## Install

```sh
cat tmux/tmux.conf > ~/.tmux.conf
```
