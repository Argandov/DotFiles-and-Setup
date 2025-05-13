" VIM-PLUG
" Install plugins with plugin manager: (https://github.com/junegunn/vim-plug/blob/master/plug.vim) -
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" run - :PlugInstall
" Dependencies - Git
"
call plug#begin('~/.vim/plugged')

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" WakaTime
Plug 'wakatime/vim-wakatime'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Nerdfonts for Vim:
Plug 'ryanoasis/vim-devicons'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Exafunction/codeium.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive' " Vim+Git
Plug 'morhetz/gruvbox'
Plug 'nikolvs/vim-sunbather'

Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale' " Linting for programming languages (Set linters)
" ale tools: https://github.com/dense-analysis/ale#installation-with-vim-plug
call plug#end()

" Codeium settings; disable for Markdown:
let g:codeium_filetypes = {
    \ "markdown": v:false,
    \ }

""""""""""""""SETTINGS"""""""""""""""
let g:gruvbox_contrast_dark='hard'
let g:airline_theme = 'gruvbox'
"
" colorscheme sunbather
colorscheme vim-monokai-tasty " From JJ
set background=dark

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
let g:airline_theme='powerlineish'


au BufRead,BufNewFile *.md set filetype=markdown 
"au BufRead,BufNewFile *.md colorscheme murphy
syntax on " highlight syntax

let g:go_highlight_extras    = {}     " turn off all vim-go extras
let g:go_highlight_operators = 0      " e.g. `+`, `-`, `*`

set encoding=UTF-8
set fillchars=eob:\ 
set ic is hls
set relativenumber
set hidden		" Jump into open buffers without needing to save
set number
" set nowrap " Line wrapping: No new line when text gets to the end
set smartindent " indentation for code
set tabstop=4 softtabstop=4
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type
" set visualbell
" set number " show line numbers

""""""""""""""KEY MAPPINGS"""""""""""""""

" leader key
let mapleader = " "

" Ctrl-k to open fzf’s buffer picker
"nnoremap <silent> <C-k> :Buffers<CR>
" Ctrl-p to open fzf’s file picker:
"nnoremap <silent> <C-p> :Files<CR>

" Space k to open fzf’s buffer picker
nnoremap <Leader>k :Buffers<CR>

" Space p to open fzf’s file picker
nnoremap <Leader>p :Files<CR>

nnoremap <silent> <Leader>t :tabnew<Bar>Files<CR>


" SPLIT NAVIGATION
" leader + h/j/k/l to move between splits
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
" quick tab next/prev
" Tab for next tab
nnoremap <silent> <Tab>   :tabnext<CR>
" Shift-Tab (aka <S-Tab>) for previous tab
nnoremap <silent> <S-Tab> :tabprevious<CR>


command! Go terminal go run %
map <C-g> :Goyo 100<CR>
map <C-f> :Goyo!<CR>
inoremap kj <Esc>
" Window navigation, easy:
nnoremap gw <C-w>
" Delete words easily (Forward and backwards)
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Move forward between words
" H and L to scroll up and down by half a page:
nnoremap H 10j
nnoremap L 10k
" Commands
map QQ :x <Enter>
map U <C-r> " Redo
" map ' $ 

"""""""""Plugin configurations"""""""""""

"let g:airline_theme='vim-monokai-tasty'

let g:ale_linters = { 'python': ['flake8'], 'go': ['govet', 'golint', 'revive'] }
let g:airline#extensions#tabline#enabled = 1
