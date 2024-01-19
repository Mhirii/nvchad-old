# STILL IN EARLY WIP!

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

## Configuration
+ You can go to lua/custom/settings.lua and disable the languages/motions you dont need.
+ Dont forget to tweak the servers in overrides.lua and lspconfig.lua to your need.

   
## Plugins

### color

+ [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)
### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
### comment

+ [LudoPinelli/comment-box.nvim](https://dotfyle.com/plugins/LudoPinelli/comment-box.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [mawkler/modicator.nvim](https://dotfyle.com/plugins/mawkler/modicator.nvim)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
### keybinding

+ [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)
+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [aznhe21/actions-preview.nvim](https://dotfyle.com/plugins/aznhe21/actions-preview.nvim)
+ [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [VidocqH/lsp-lens.nvim](https://dotfyle.com/plugins/VidocqH/lsp-lens.nvim)
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim)
+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### marks

+ [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### motion

+ [phaazon/hop.nvim](https://dotfyle.com/plugins/phaazon/hop.nvim)
### nvim-dev

+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### programming-languages-support

+ [dmmulroy/tsc.nvim](https://dotfyle.com/plugins/dmmulroy/tsc.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### quickfix

+ [kevinhwang91/nvim-bqf](https://dotfyle.com/plugins/kevinhwang91/nvim-bqf)
### scrolling

+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### utility

+ [sudormrfbin/cheatsheet.nvim](https://dotfyle.com/plugins/sudormrfbin/cheatsheet.nvim)
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
+ [nguyenvukhang/nvim-toggler](https://dotfyle.com/plugins/nguyenvukhang/nvim-toggler)
+ [crusj/bookmarks.nvim](https://dotfyle.com/plugins/crusj/bookmarks.nvim)
+ [rktjmp/paperplanes.nvim](https://dotfyle.com/plugins/rktjmp/paperplanes.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
### web-development

+ [roobert/tailwindcss-colorizer-cmp.nvim](https://dotfyle.com/plugins/roobert/tailwindcss-colorizer-cmp.nvim)
## Language Servers

+ clangd
+ cmake
+ cssls
+ graphql
+ html
+ rust_analyzer
+ tsserver
+ volar
