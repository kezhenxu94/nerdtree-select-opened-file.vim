# Select Opened File in NERDTree

## Prerequisites

This is a plugin that works with
[NERDTree](https://github.com/preservim/nerdtree), if you don't have it already,
please install it first.

## Install

Use the same installation method as you use for other NERDTree plugin. Here is
mine with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug "kezhenxu94/nerdtree-select-opened-file.vim"
```

Save it, and install it with `:PlugInstall`.

## Usage

This plugin provides a new command `NERDTreeSelectOpenedFile`, which you can
use directly in an open file, or you can map it to a key binding:

```vim
nnoremap <silent> <leader>1 :NERDTreeSelectOpenedFile<CR>
```

## More

This plugin is inspired by the project explorer in some moreden IDEs, such as
JetBrains IDE products, and mimics most of the behaviours in those IDEs:

- If the NERDTree is not opened, it will be opened automatically.
- If the NERDTree is opened, but not focused, it will be focused automatically.
- If the NERDTree is opened and focused, it will be closed automatically.
- If the current file is not inside the NERDTree's root directory, nothing is
  selected, instead, the NERDTree is opened and focused.
