## Install Instructions

 > Install requires Neovim 0.9.5+. Always review the code before installing a configuration.

 1. Install [NvChad](https://nvchad.com/docs/quickstart/install)
```sh
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
2. move or delete the example config
```sh
mv ~/.config/nvim/lua ~/.config/old_nvim_lua
```
3. clone this repo
```sh
git clone https://github.com/Mhirii/nvchad/ ~/.config/nvim/lua && nvim
```
4. open nvim and let the plugins install
5. Enjoy!

## Features:
+ Readable, Modular, Extensible Config (Tried to make the code readable and write comments to document everything)
+ Fast, Nvchad is blazingly fast, the extra plugins i added are loaded correctly  
+ Mappings in whichkey menu are prefixed with nerd icons to reduce mental overhead
+ Conform For Formatting (you can switch to none-ls, check settings.lua)
+ Eye pleasing plugins (Noice, Reactive, Neoscroll..)
+ Previews (references, definition, :<number>, code actions)
+ Tmux and wezterm support
+ Animated Auto Resizing panes (toggle it with <space>sa
+ Custom Themes (IDX ported from vscode and nero) 
+ Lots of utility plugins
  
## Configuration
 You can go to lua/custom/settings.lua and disable the anything you dont want.
 Dont forget to tweak the servers in overrides.lua and lspconfig.lua to your needs.

The Codebase is relatively easy to understand:
+ each plugin is configured in lua/configs/[plugin-name].lua and imported in plugins.lua, this way plugins.lua is very easy to read and all the mess is kept away.
+ plugins and their mappings only load when they are enabled inside settings.lua
+ native nvchad plugins are overridden in lua/overrides
+ most of the plugins will only load on their relative event (filetype, keybind, command..)
+ check chadrc.lua if you want to change the theme, dashboard, or statusline.
+ nerd icons are easily changable in icons.lua
+ check neovide.lua if you use it
+ Copilot and codeium are configured (enable them in settings.lua)
+ opts and autocmds in init.lua

> ### Note:
> This configuration is Focused on typescript as thats what im doing lately
> ### Warning:
> Golang setup is kinda buggy

  
   ## Plugins
> WIP
