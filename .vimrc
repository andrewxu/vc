set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin manager
Plugin 'VundleVim/Vundle.vim'
nmap <leader>bi :PluginInstall<cr>
nmap <leader>bu :PluginUpdate<cr>
nmap <leader>bc :PluginClean<cr>

" Airline status bar
" fonts: https://github.com/powerline/fonts
Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
set guifont=Inconsolata-g\ for\ Powerline:h12
let g:airline_section_z = '%f'

" Nerd Tree
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
nnoremap <leader>1 :NERDTreeToggle<CR>
" Custom file extension color mapping
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFoldersFullName = 0
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'ts', 'vue', 'hbs', 'css', 'json', 'txt']
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['txt'] = "acacac"
let g:NERDTreeExtensionHighlightColor['json'] = "737373"
let g:NERDTreeExtensionHighlightColor['js'] = "c561ca"
let g:NERDTreeExtensionHighlightColor['ts'] = "89608b"
let g:NERDTreeExtensionHighlightColor['vue'] = "20b541"
let g:NERDTreeExtensionHighlightColor['hbs'] = "b4b4b4"
let g:NERDTreeExtensionHighlightColor['css'] = "ff3bc8"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Vim Fugitive - git wrapper in vim (GBlame)
Plugin 'tpope/vim-fugitive'

" Auto pairs - brackets autocomplete
Plugin 'jiangmiao/auto-pairs'

" fzf - fuzz search (via homebrew)
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf'              " Core fzf binary
Plugin 'junegunn/fzf.vim'          " Vim integration
nnoremap <D-p> :Files<CR>

" FixWhitespace
Plugin 'git@github.com:bronson/vim-trailing-whitespace.git'

" Syntax/Autocomplete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Typescript Synatax Replacement
Plugin 'HerringtonDarkholme/yats.vim'
au BufNewFile,BufRead *.ts set filetype=typescript

" Tagbar - overview of all functions in a file
Plugin 'majutsushi/tagbar'
nnoremap <leader>2 :TagbarToggle<CR>

" Syntastic
"Plugin 'git://github.com/scrooloose/syntastic.git'
"let g:syntastic_enable_elixir_checker = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javasciprt_checkers = ['eslint']
"let g:syntastic_php_checkers = ['phpcs']
"let g:syntastic_elixir_checkers = ['elixir']
"let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'
"let g:syntastic_html_checkers = ['']

" Html Annoyance - removes underline on <a> tags
"Plugin 'git://github.com/tudorprodan/html_annoyance.vim.git'

" Vim Handlebars Highlight
"Plugin 'https://github.com/nono/vim-handlebars'

" Match HTML Tags
"Plugin 'https://github.com/Valloric/MatchTagAlways'

" Sum Tool
" Usage: <leader>su
Plugin 'https://github.com/vim-scripts/visSum.vim'

" Sleuth (Auto Tab detect & set)
Plugin 'git@github.com:tpope/vim-sleuth.git'

" Css Colors
Plugin 'https://github.com/ap/vim-css-color'

call vundle#end()            " required
filetype plugin indent on    " required

" General UI
syntax enable       " Enable syntax highlighting
set re=2            " New RegexEngine for syntax
set nu              " Line Numbers On
set nowrap          " Turn off wrapping
set encoding=utf-8  " Set font encoding
set laststatus=2    " Always show status line
set cmdheight=1     " Set command line height
set matchtime=2     " How many tenths of a second to blink
set showmatch       " Show matching brackets
set colorcolumn=120 " 120 Char limit marker
set cindent         " Intelligent indenting on newlines
set wildmenu        " Turn on wild menu
set wildmode=longest,list  " Set show list for wildmode
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
set ignorecase      " Case Insensitive search
set smartcase       " Intelligent Case sensitive searching
set incsearch       " Incremental search, matches while typing
set hlsearch        " Highlight matches
set foldlevelstart=99   " Remove folds by default
set foldmethod=indent
set tabstop=2
set expandtab
set shiftwidth=2
set mouse=a

" Touchbar
let g:macvim_default_touchbar_fullscreen=0

" Custom Shorter-Cuts
imap jj <ESC>
imap kk <ESC>
imap hh <ESC>
nmap <silent> <C-d> :tabprev<cr>
nmap <silent> <C-f> :tabnext<cr>
nmap <space> za
vnoremap Y "+y

" Custom Commands
command! Pj %!python3 -m json.tool
command! Px :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
command! Fs set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
command! Fw :FixWhitespace
command! Gb Git blame

source ~/.vim/shortcuts.vim
" add the following to shortcuts.vim
" command! Cdx cd /Users/u/Documents/Path/To/X

" Auto Source .vimrc when saved
if has ("autocmd")
	augroup AutoReloadVimRC
		au!
		" Auto source vimrc on save
		au BufWritePost $MYVIMRC so $MYVIMRC
	augroup END
endif

" Define custom highlight groups for each tag
highlight TodoTODO ctermbg=Green  ctermfg=Black guibg=#a8ff60 guifg=#000000
highlight TodoBUG ctermbg=Red    ctermfg=White guibg=#ff0000 guifg=#ffffff
highlight TodoIMPORTANT ctermbg=DarkRed ctermfg=White guibg=#ff0000 guifg=#ffffff
highlight TodoNOTE  ctermbg=Cyan   ctermfg=Black guibg=#00ffff guifg=#000000
highlight TodoTBD  ctermbg=Yellow ctermfg=Black guibg=#ffff00 guifg=#000000

" Match tags and link to their highlight groups
match TodoTODO /\c\<TODO\>/
match TodoBUG /\c\<BUG\>/
match TodoIMPORTANT /\c\<IMPORTANT\>/
match TodoNOTE /\c\<NOTE\>/
match TodoTBD /\c\<TBD\>/

" Re-apply highlights when entering/leaving buffers or insert mode
autocmd BufWinEnter * call s:HighlightTodos()
autocmd InsertEnter * call s:HighlightTodos()
autocmd InsertLeave * call s:HighlightTodos()
autocmd BufWinLeave * call clearmatches()

" Function to highlight all tags
function! s:HighlightTodos()
  call clearmatches()
  call matchadd('TodoTODO',  '\c\<TODO\>')
  call matchadd('TodoBUG', '\c\<BUG\>')
  call matchadd('TodoIMPORTANT', '\c\<IMPORTANT\>')
  call matchadd('TodoNOTE',  '\c\<NOTE\>')
  call matchadd('TodoTBD',  '\c\<TBD\>')
endfunction
