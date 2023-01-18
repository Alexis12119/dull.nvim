# Dull

A colorscheme made for fun and educational purposes only.

## 🔔 Reminder

* It's for my [nvim-config](https://github.com/Alexis12119/nvim-config).
* I used [Neovide](https://github.com/neovide/neovide) to make the background transparent in the screenshots.

## 📷 Screenshots

<div align="center">

**Night**
![Night](https://user-images.githubusercontent.com/74944536/210137844-8666c857-59a7-4295-8e5c-8f835d679184.png)

**Slime**
![Slime](https://user-images.githubusercontent.com/74944536/210137853-dc637aea-c8bc-4068-935b-a7cb3b047469.png)

**Sunset**
![Sunset](https://user-images.githubusercontent.com/74944536/210137852-3d4f1e6c-be26-4fd9-9d69-11a798b7476e.png)

</div>

## ⚡️ Requirements

- Neovim >= 0.6.0

## 💻 Installation

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use "Alexis12119/dull.nvim"
```

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'Alexis12119/dull.nvim'
```

[lazy](https://github.com/folke/lazy.nvim)

```lua
{ "Alexis12119/dull.nvim" }
```
## 🚀 Usage

```vim
" VimScript
colorscheme dull-night " Night

colorscheme dull-slime " Slime

colorscheme dull-sunset " Sunset

colorscheme dull
```
```lua
-- Lua
vim.cmd "colorscheme dull-night" -- Night

vim.cmd "colorscheme dull-slime" -- Slime

vim.cmd "colorscheme dull-sunset" -- Sunset 

vim.cmd "colorscheme dull"
```

##  ⚙️ Configuration

> ❗️ Configuration needs to be set **BEFORE** loading the colorscheme.

```lua
require("dull").setup({
    style = "night" -- night, slime, sunset
    transparent = false, -- experimental
})
```

## Credits
Thanks to this repo I managed to create my own colorscheme.

* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
