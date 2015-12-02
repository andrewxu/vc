set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin manager
Plugin 'VundleVim/Vundle.vim'
nmap <leader>bi :PluginInstall<cr>
nmap <leader>bu :PluginInstall!<cr>
nmap <leader>bc :PluginClean<cr>

" Airline status bar
Plugin 'git://github.com/bling/vim-airline.git'
let g:airline_powerline_fonts = 1

" Nerd Tree
Plugin 'git://github.com/scrooloose/nerdtree.git'
nnoremap <leader>1 :NERDTreeToggle<CR>
" Custom file extension color mapping
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('php', 'black', 'none', 'black', 'white')
call NERDTreeHighlightFile('js', 'black', 'none', 'black', 'yellow')

" Nerd Commenter - |cc to comment
Plugin 'git://github.com/scrooloose/nerdcommenter.git'

" Vim Align
Plugin 'git://github.com/tsaleh/vim-align.git'

" Vim Fugitive - git wrapper in vim
Plugin 'git://github.com/tpope/vim-fugitive.git'

" CtrlP - fuzz search
Plugin 'git://github.com/kien/ctrlp.vim.git'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.git,.hg,.bzr,.sass-cache,*.class,htdocs/framework/**,public/images/**,public/audio/**,public/docs/**,public/software/**,public/flash/**

" FixWhitespace
Plugin 'git@github.com:bronson/vim-trailing-whitespace.git'

" Tagbar - overview of all functions in a file
Plugin 'git://github.com/majutsushi/tagbar.git'
nnoremap <leader>2 :TagbarToggle<CR>

" Syntastic
Plugin 'git://github.com/scrooloose/syntastic.git'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javasciprt_checkers = ['jshint']
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_html_checkers = ['']

" Html Annoyance - removes underline on <a> tags
Plugin 'git://github.com/tudorprodan/html_annoyance.vim.git'

" Vim Auto-Pairs
Plugin 'git://github.com/jiangmiao/auto-pairs.git'

" Vim Twig Syntax Highlight
Plugin 'https://github.com/evidens/vim-twig'

" Match HTML Tags
Plugin 'https://github.com/Valloric/MatchTagAlways'

call vundle#end()
filetype plugin indent on

" Sum Tool
" Usage: <leader>su
Plugin 'https://github.com/vim-scripts/visSum.vim'

" General UI
syntax enable       " Enable syntax highlighting
set nu              " Line Numbers On
set nowrap          " Turn off wrapping
set encoding=utf-8  " Set font encoding
set laststatus=2    " Always show status line
set cmdheight=2     " Set command line height
set tags=./tags,tags; " Set ctags in current directory and then up
set matchtime=2     " How many tenths of a second to blink
set showmatch       " Show matching brackets
set tabstop=2       " Make tabs 2 spaces
set shiftwidth=2    " Intelligently indent 'tabs'
set cindent         " Intelligent indenting on newlines
"set expandtab       " Insert space when hitting tab in the middle of text
set noexpandtab     " Use tabs and not space
set wildmenu        " Turn on wild menu
set wildmode=longest,list  " Set show list for wildmode
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
:cd /Volumes/projects/freshapp/ 	" Defaulting directory
set ignorecase      " Case Insensitive search
set smartcase       " Intelligent Case sensitive searching
set incsearch       " Incremental search, matches while typing
set hlsearch        " Highlight matches
set foldlevelstart=99   " Remove folds by default
set foldmethod=indent

" Custom Shorter-Cuts
imap jj <ESC>
nmap <silent> <C-d> :tabprev<cr>
nmap <silent> <C-f> :tabnext<cr>
"map <C-\> :split<CR>:exec("tag ".expand("<cword>"))<CR> 	" Ctags split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>	" Ctags tabe
nmap <space> za

" Auto Source .vimrc when saved
if has ("autocmd")
	augroup AutoReloadVimRC
		au!
		" Auto source vimrc on save
		au BufWritePost $MYVIMRC so $MYVIMRC
	augroup END
endif
