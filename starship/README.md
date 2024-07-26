# Bashrc

## Instal NerdFont (onetime task)

To install nerdfonts

```sh
curl -sS https://webi.sh/nerdfont | sh
```

ref: https://webinstall.dev/nerdfont/

## iTerm2

Find iTerm2 in the top Mac menu, then...

```sh
=> Preferences (Cmd ⌘ + ,)
=> Profiles
=> Text
=> Font
=> Select "DroidSansMono Nerd Font"
```

## VSCode

Setting Visual Studio Code
Without proper configuration, Visual Studio Code unfortunately doesn't display Nerd Fonts icons correctly. Therefore, you need to perform the following setup in your Visual Studio Code:

* Open the Settings Page.
* Search for settings using the keyword 'terminal.integrated.fontFamily'.
* click on 'Editor: Font Family' link
* Append "'DroidSansMono Nerd Font'" into the 'Editor: Font Family' field. It will look like this `Menlo, Monaco, 'Courier New', monospace, DroidSansMono Nerd Font`

ref: https://dev.to/owl777/how-to-show-nerd-fonts-in-visual-studio-code-15fd

## starship.toml (onetime task)

```sh
# To start from a preset
starship preset gruvbox-rainbow --output starship/gruvbox-rainbow.toml
```

Edit the .toml files as needed. Below are some examples of the edit I made

```toml
[directory]
truncate_to_repo = false

[kubernetes]
disabled = false

[helm]
disabled = true
```

## Install

```sh
cat starship/gruvbox-rainbow.toml > ~/.config/starship.toml
  
# or
cat starship/plain-text-symbols.toml > ~/.config/starship.toml
```
