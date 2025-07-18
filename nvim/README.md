# nvmim

## Ref

* [neovim.io](https://neovim.io/)
* [nvui](https://nvchad.com/news/nvui)

## Setup

```sh
brew install nvim
git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1


# How to find your config
find ~/.config/nvim -name "*.lua" -o -name "*.vim" | xargs grep -l "nvim-tree"
/Users/tonygilkerson/.config/nvim/lua/plugins/init.lua

#Edit ~/.config/nvim/lua/plugins/init.lua and add the following in the `return` block:
  
  -- AEG Modification
  -- nvim-tree configuration to show full path
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      renderer = {
        root_folder_label = ":~:s?$?/..?", -- Shows full path with ~ for home directory
      },
    },
  },

```

### Let’s take a look at some of NvChad’s preinstalled plugins:

#### Theme Selector

* Press `<Spacebar>th` (Press `<spacebar>` once then release, press `t` once then release and then press `h` then release) to open the theme selector. Select a theme and press `<ENTER>` or `<ESC>` twice to close it.

#### File navigation with nvim-tree.lua

* Press `<Ctrl>n` to toggle the file navigator. (If there are no files or folders listed, it means the directory in which you launched Neovim is empty)
* Press `<ENTER>` to expand a folder or open a file.
* Press `g?` to show a list of mappings for the file navigator. Press `q` to close the list.

#### File searching with telescope.nvim

* Press `<Spacebar>ff` to open the Find Files window and press `<ESC>` twice to close it.

#### Cheatsheet

* Press `<Spacebar>ch` to show all the keyboard mappings. Use it to explore more features.
* You will notice that some mappings start with 
  * `<leader>` which is referring to the Spacebar key. 
  * `C` is for the Ctrl/Control key, 
  * `A` is for the Alt/Option key and `S` is for the Shift key.
