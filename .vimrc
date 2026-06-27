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
"Plugin 'vim-airline/vim-airline'
"let g:airline_powerline_fonts = 1
"set guifont=Inconsolata-g\ for\ Powerline:h12
"let g:airline_section_z = '%f'

" Nerd Tree
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
nnoremap <leader>1 :NERDTreeToggle<CR>
let NERDTreeIgnore = ['node_modules$', '\.DS_Store$']
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

" Vim Fugitive - git wrapper in vim (GBlame)
Plugin 'tpope/vim-fugitive'
command! Gblame Git blame --date=short

" Auto pairs - brackets autocomplete
Plugin 'jiangmiao/auto-pairs'

" fzf - fuzz search (via homebrew)
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf'              " Core fzf binary
Plugin 'junegunn/fzf.vim'          " Vim integration
nnoremap <D-p> :Files<CR>
" IMPORTANT: Acki search term (no quotes allowed)
command! -nargs=* Acki call fzf#vim#grep(
  \ 'ack -i ' .
  \ '--ignore-file=match:.byebug_history ' .
  \ '--ignore-file=match:README.rdoc ' .
  \ '--ignore-file=match:stats.json ' .
  \ '--ignore-file=match:package-lock.json ' .
  \ '--ignore-dir=tmp --ignore-dir=log --ignore-dir=logs ' .
  \ '--ignore-dir=storage --ignore-dir=bin --ignore-dir=dist --ignore-dir=node_modules ' .
  \ shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ 0)
" Disables fzf :W command, and remap to just save
command! W w

" FixWhitespace
Plugin 'git@github.com:bronson/vim-trailing-whitespace.git'
" Highlight trailing whitespace in red
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red

" Autocomplete
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ get(b:, 'coc_enabled', 0) ? coc#refresh() : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
highlight! CocSearch ctermfg=DarkRed ctermbg=NONE cterm=bold
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Restart on new models (for tsserver)
"autocmd BufWritePost */models/*.ts :CocRestart
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)

" Typescript Synatax Replacement
Plugin 'HerringtonDarkholme/yats.vim'
au BufNewFile,BufRead *.ts set filetype=typescript

" Vue Syntax
Plugin 'leafOfTree/vim-vue-plugin'
let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': ['script', 'style'],
      \'attribute': 1,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

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
Plugin 'https://github.com/nono/vim-handlebars'

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
set iskeyword+=-    " Treat "-" as part of word lookup
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
set splitright      " vsplit to the right

" support * search for id=some-id and #some-id
function! StarSearch()
  " Get the word under the cursor
  let word = expand('<cword>')
  " If word already starts with #, remove it for matching
  if word[0] ==# '#'
    let bare = word[1:]
  else
    let bare = word
  endif
  " Build regex to match either bare word or #word
  let @/ = '\v#?' . bare
  set hlsearch
  " Jump to next match
  normal! n
endfunction
nnoremap <silent> * :call StarSearch()<CR>

" Touchbar
let g:macvim_default_touchbar_fullscreen=0

" Custom Shorter-Cuts
imap jj <ESC>
imap kk <ESC>
imap hh <ESC>
imap ;; <ESC>
" Smooth scrolling with cursor movement (Shift + H/J/K/L)
nnoremap <S-H> 10h      " Move cursor left (also scrolls if needed)
nnoremap <S-L> 10l      " Move cursor right (also scrolls if needed)
nnoremap <S-J> 5j       " Move cursor down (faster than default)
nnoremap <S-K> 5k       " Move cursor up (faster than default)
imap <silent> <C-d> <C-o>:tabprev<CR>
imap <silent> <C-f> <C-o>:tabnext<CR>
nmap <silent> <C-d> :tabprev<cr>
nmap <silent> <C-f> :tabnext<cr>
" toggle fold at cursor
nmap <space> za
" disable recording
nnoremap q <Nop>
vnoremap Y "+y

" Copy and Paste magic with iTerm2
"noremap <F8> "+P
"inoremap <F8> <C-R>+
"noremap <F9> "+y
"noremap <C-c> "+y
" F10 = Cut (delete + copy to system clipboard)
" Normal mode: Cut current line
"nnoremap <F10> "+dd
" Visual mode: Cut selection
"vnoremap <F10> "+d
" Insert mode: Cut current line (exits Insert mode)
"inoremap <F10> <Esc>"+ddi
"nnoremap <C-v> <C-v>
"vnoremap <C-v> <C-v>
"nmap <leader>` :echo "You pressed: " . getchar()<CR>

if &term =~ "xterm"
  let &t_SI = "\e[6 q"  " Insert mode: bar cursor
  let &t_EI = "\e[2 q"  " Normal mode: block cursor
endif

" Auto-restore mouse mode after terminal disruptions
if has('mouse')
  set mouse=a
  augroup FixMouse
    autocmd!
    autocmd FocusGained * set mouse=a
  augroup END
endif

" Custom Commands
command! Pj %!python3 -m json.tool
command! Px :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
command! Fs set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
command! Fw :FixWhitespace
command! Gb Git blame

source ~/.vim/shortcuts.vim
" add the following to shortcuts.vim
" command! Cdx cd /Users/u/Documents/Path/To/X

" Auto Source .vimrc when saved (only this vim window)
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
highlight TodoWARNING ctermbg=DarkRed ctermfg=White guibg=#ff0000 guifg=#ffffff
highlight TodoNOTE  ctermbg=Cyan   ctermfg=Black guibg=#00ffff guifg=#000000
highlight TodoTBD  ctermbg=DARKYELLOW ctermfg=Black guibg=#ffa07a guifg=#000000
highlight TodoIDEA  ctermbg=Yellow ctermfg=Black guibg=#ffff00 guifg=#000000

" Match tags and link to their highlight groups
match TodoTODO /\c\<TODO\>/
match TodoBUG /\c\<BUG\>/
match TodoIMPORTANT /\c\<IMPORTANT\>/
match TodoWARNING /\c\<WARNING\>/
match TodoNOTE /\c\<NOTE\>/
match TodoTBD /\c\<TBD\>/
match TodoIDEA /\c\<IDEA\>/

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
  call matchadd('TodoWARNING', '\c\<WARNING\>')
  call matchadd('TodoNOTE',  '\c\<NOTE\>')
  call matchadd('TodoTBD',  '\c\<TBD\>')
  call matchadd('TodoIDEA',  '\c\<IDEA\>')
endfunction

augroup vue_jump
  autocmd!
  autocmd BufEnter *.vue nnoremap <buffer> 1 /^<template<CR>
  autocmd BufEnter *.vue nnoremap <buffer> 2 /^<script<CR>
  autocmd BufEnter *.vue nnoremap <buffer> 3 /^<style<CR>
  autocmd BufEnter *.ts nnoremap <buffer> 4 /^export function <CR>
augroup END

" Autoreload
" Automatically reload file if changed outside and no unsaved changes
set autoread
" Trigger autoread on focus or terminal events
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
"augroup AutoReloadSafe
"  autocmd!
"  autocmd FileChangedShell * echo "File changed externally! Use ':edit!' to reload."
"  autocmd CursorHold * if !&modified | checktime | endif
"augroup END

" Notify only if there are unsaved changes
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Unsaved changes detected!" | echohl None

" Log all events to a file (use :messages to view later)
"set verbosefile=~/vimlog.txt
"set verbose=9  " Logs everything (9=minimal, 15=detailed)

" For VisualSelect + Expand/Collapse imports quickly
function! ExpandImport() range
  let lines = getline(a:firstline, a:lastline)
  let full = join(lines, ' ')
  let match = matchlist(full, 'import\s*{\s*\(.\{-}\)\s*}\s*\(from\s*.\+\)')
  if empty(match) | return | endif
  let items = split(match[1], '\s*,\s*')
  let indent = repeat(' ', 2)
    let result = ['import {']
  for item in items
    call add(result, indent . trim(item) . ',')
  endfor
  let result[-1] = substitute(result[-1], ',$', '', '')
  call add(result, '} ' . trim(match[2]))
  execute a:firstline . ',' . a:lastline . 'd _'
  call append(a:firstline - 1, result)
endfunction

function! CollapseImport() range
  let lines = getline(a:firstline, a:lastline)
  let full = join(map(lines, 'trim(v:val)'), ' ')
  let match = matchlist(full, 'import\s*{\s*\(.\{-}\)\s*}\s*\(from\s*.\+\)')
  if empty(match) | return | endif
  let items = split(match[1], '\s*,\s*')
  let cleaned = map(items, 'substitute(trim(v:val), ",$", "", "")')
  let result = 'import { ' . join(cleaned, ', ') . ' } ' . trim(match[2])
  execute a:firstline . ',' . a:lastline . 'd _'
  call append(a:firstline - 1, result)
endfunction
xnoremap o :call ExpandImport()<CR>
xnoremap i :call CollapseImport()<CR>
