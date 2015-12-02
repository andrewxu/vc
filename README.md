Installation
============

`git clone git@github.com:andrewxu/vc.git`

`cd vc`

`./makeLinks` - This will create symlinks in your HOME dir and checkout the initial Vundle plugin for vim and then open vim and install the other bundles. Make sure you've removed your existing `.vimrc` and `.vim/`

Key Mappings
------------

IDE Stuff
---------

* `\1` - NERDTree Toggle
* `\2` - TagBar
* `\3` - NERDTree Find

Tab/Split Keys
--------------

* `Ctrl-h/j/k/l` -  Navigate split windows
* `Ctrl+f` - Previous Tab
* `Ctrl+g` - Next Tab
* `Ctrl+c` - Close current tab
* `Ctrl+t` - Open new tab with `:e` active

Vundle
--------

* `\bi` - `:BundleInstall`
* `\bu` - `:BundleInstall!` (Install & Update)
* `\bc` - `:BundleClean`

Misc
-------

* `\ev` - Edit .vimrc
* `jj` - `Esc` alias

Stock Plugins
------------

* [Vundle](https://github.com/gmarik/vundle) - Vundle is a plugin managemer similar to Pathogen
* [Airline](git://github.com/bling/vim-airline.git) - Lean & Mean status bar
* [NERDTree](https://github.com/scrooloose/nerdtree) - A directory tree explorer for vim.
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter) - A powerful plugin for commenting code
* [Align](https://github.com/tsaleh/vim-align) - Plugin that is useful for aligning text
* [Fugitive](https://github.com/tpope/vim-fugitive) - An awesome Git wrapper
* [CtrlP](git://github.com/kien/ctrlp.vim.git) - Fuzzy Wuzzy search
* [FixWhitespace] (git@github.com:bronson/vim-trailing-whitespace.git) - Fixes whitespaces
* [Tagbar](https://github.com/majutsushi/tagbar) - Lets you see functions, methods, and properties in your current file and jump to them.
* [Syntastic](https://github.com/scrooloose/syntastic) - Adds smart parenthesis/brackets and a few other syntax tweaks to your files
* [Html Annoyance](https://github.com/tudorprodan/html_annoyance.vim) - Fixes a few annoyances when editing HTML, paricularly the underline of anchor tages when they span multiple lines
* [AutoPairs] (git://github.com/jiangmiao/auto-pairs.git) - auto pairs parenthesis
* [Twig] (https://github.com/evidens/vim-twig) - Vim Twig syntax highlighting
* [MatchTagAlways] (https://github.com/Valloric/MatchTagAlways) - matches html tags so it's easier to find
* [SumTool] (https://github.com/vim-scripts/visSum.vim) - Sums up numbers in visual block selection
