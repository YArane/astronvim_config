# AstroNvim Config
My AstroNvim Config

## Features
* All features from astronvim: https://github.com/AstroNvim/AstroNvim#-features.
* Added support for rust-tools: https://github.com/simrat39/rust-tools.nvim.
* Vimwiki with calendar support: https://github.com/vimwiki/vimwiki.
* Custom `nvim-cmp` ordering.

## Preview
![Coding Preview Image](https://user-images.githubusercontent.com/6415531/221275972-e139acb6-770f-4d8f-80f4-ca94f24b5aa1.png)

## Prerequisites
* `unzip`
* `cargo`
* `rust-src` --for lsp server
* `ripgrep` (optional)

## Installation

You can config `AstroNvim` in both `.config/nvim/lua/user` or `.config/astronvim/lua/user`.

```bash
  git clone https://github.com/YArane/astronvim_config ~/.config/astronvim/lua/user
  nvim +PackerSync
```
#### Install language server protocols
```vim
:LspInstall rust
:LspInstall lua
```
#### Install language parsers
```vim
:TSInstall rust
:TSInstall lua
```
#### Install debugger
```vim
:DapInstall codelldb
```
