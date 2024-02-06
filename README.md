## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

 1. Install [NvChad](https://nvchad.com/docs/quickstart/install)
```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
2. inside neovim type :NvChadUpdate
3. clone this repo
```sh
git clone https://github.com/Mhirii/nvchad/ ~/.config/nvim/lua/custom
```
4. open nvim and let the plugins install
5. Enjoy!

## Features:
+ Readable, Modular, Extensible Config (Tried to make the code readable and write comments to document everything)
+ Fast, Nvchad is blazingly fast, the extra plugins i added are loaded correctly  
+ Mappings are prefixed with nerd icons to reduce mental overhead
+ Conform For Formatting (you can switch to nonels, check settings.lua)
+ Eye pleasing plugins (Noice, Neoscroll..)
+ Previews (references, definition, :<number>, code actions)
+ Tmux and wezterm support
+ Animated Auto Resizing panes
+ Lots of utility plugins
  
## Configuration
 You can go to lua/custom/settings.lua and disable the anything you dont want.
 Dont forget to tweak the servers in overrides.lua and lspconfig.lua to your needs.

The Codebase is relatively easy to understand:
+ plugins configured in custom/configs and imported in plugins.lua, this way plugins.lua is very easy to read and all the mess is kept away.
+ plugins and their mappings only load when they are enabled inside settings.lua
+ native nvchad plugins are overridden in custom/overrides
+ most of the plugins will only load on their relative event (filetype, keybind, command..)
+ check ui.lua if you want to change he theme, dashboard, or statusline.
+ I tweaked the themes in theme.lua and highlights.lua, you might wonna take a look there  
+ nerd icons are easily changable in icons.lua
+ check neovide.lua if you use it

> ### Note:
> This configuration is Focused on typescript as thats what im doing lately

  
   ## Plugins

### LSP / Coding Support

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
+ [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)
+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [VidocqH/lsp-lens.nvim](https://dotfyle.com/plugins/VidocqH/lsp-lens.nvim)
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim)

#### Lang Support

+ [mrcjkb/rustaceanvim](https://dotfyle.com/plugins/mrcjkb/rustaceanvim)
+ [ray-x/go.nvim](https://dotfyle.com/plugins/ray-x/go.nvim)
+ [dmmulroy/tsc.nvim](https://dotfyle.com/plugins/dmmulroy/tsc.nvim)
+ [roobert/tailwindcss-colorizer-cmp.nvim](https://dotfyle.com/plugins/roobert/tailwindcss-colorizer-cmp.nvim)

### UI

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

#### Previewing
+ [aznhe21/actions-preview.nvim](https://dotfyle.com/plugins/aznhe21/actions-preview.nvim)
+ [DNLHC/glance.nvim](https://github.com/DNLHC/glance.nvim)

#### cursorline

+ [mawkler/modicator.nvim](https://dotfyle.com/plugins/mawkler/modicator.nvim)
+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### Utility

+ [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
+ [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
+ [nguyenvukhang/nvim-toggler](https://dotfyle.com/plugins/nguyenvukhang/nvim-toggler)
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
+ [sudormrfbin/cheatsheet.nvim](https://dotfyle.com/plugins/sudormrfbin/cheatsheet.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

#### keybinding

+ [tris203/hawtkeys.nvim](https://dotfyle.com/plugins/tris203/hawtkeys.nvim)
+ [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)

#### comment

+ [LudoPinelli/comment-box.nvim](https://dotfyle.com/plugins/LudoPinelli/comment-box.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

#### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
+ [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
+ [crusj/bookmarks.nvim](https://dotfyle.com/plugins/crusj/bookmarks.nvim)

#### split-and-window

+ [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)
+ [mrjones2014/smart-splits.nvim](https://dotfyle.com/plugins/mrjones2014/smart-splits.nvim)

### Telescope

+ [piersolenski/telescope-import.nvim](https://dotfyle.com/plugins/piersolenski/telescope-import.nvim)
+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### motion

+ [phaazon/hop.nvim](https://dotfyle.com/plugins/phaazon/hop.nvim)

### note-taking

+ [nvim-neorg/neorg](https://dotfyle.com/plugins/nvim-neorg/neorg)



