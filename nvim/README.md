# nvmim

## Ref

* [neovim.io](https://neovim.io/)
* [nvui](https://nvchad.com/news/nvui)

## Setup

```sh
brew install nvim

# install nerdfonts
mkdir -p ~/.local/share/fonts
# download from: https://medium.com/r?url=https%3A%2F%2Fgithub.com%2Fryanoasis%2Fnerd-fonts%2Freleases%2Fdownload%2Fv3.0.2%2FJetBrainsMono.zip
cd ~/Downloads
unzip JetBrainsMono.zip -d JetBrainsMono
mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf ~/.local/share/fonts
mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-SemiBold.ttf ~/.local/share/fonts
# Clear and regenerate your font cache with the following command:
fc-cache -f -v

# configure nvim with starter config called 'nvchad'

# ref: https://blog.spoonconsulting.com/getting-started-with-neovim-using-nvchad-a-developers-guide-f97d81e85d60
git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1
```

## Let’s take a look at some of NvChad’s preinstalled plugins:

### Theme Selector

* Press `<Spacebar>th` (Press `<spacebar>` once then release, press `t` once then release and then press `h` then release) to open the theme selector. Select a theme and press `<ENTER>` or `<ESC>` twice to close it.

### File navigation with nvim-tree.lua

* Press `<Ctrl>n` to toggle the file navigator. (If there are no files or folders listed, it means the directory in which you launched Neovim is empty)
* Press `<ENTER>` to expand a folder or open a file.
* Press `g?` to show a list of mappings for the file navigator. Press `q` to close the list.

### File searching with telescope.nvim

* Press `<Spacebar>ff` to open the Find Files window and press `<ESC>` twice to close it.

### Cheatsheet

* Press `<Spacebar>ch` to show all the keyboard mappings. Use it to explore more features.
* You will notice that some mappings start with 
  * `<leader>` which is referring to the Spacebar key. 
  * `C` is for the Ctrl/Control key, 
  * `A` is for the Alt/Option key and `S` is for the Shift key.