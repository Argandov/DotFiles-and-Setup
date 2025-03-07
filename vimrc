" VIM-PLUG
" Install plugins with plugin manager: (https://github.com/junegunn/vim-plug/blob/master/plug.vim) -
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" run - :PlugInstall
" Dependencies - Git
call plug#begin('~/.vim/plugged')

" WakaTime
Plug 'wakatime/vim-wakatime'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Nerdfonts for Vim:
Plug 'ryanoasis/vim-devicons'

Plug 'Exafunction/codeium.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive' " Vim+Git
Plug 'morhetz/gruvbox'
" Plug 'nikolvs/vim-sunbather'
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
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

let g:airline_theme = 'gruvbox'
" colorscheme sunbather
" colorscheme vim-monokai-tasty " From JJ
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

map <C-g> :Goyo 100<CR>
map <C-f> :Goyo!<CR>
inoremap kj <Esc>
" Delete words easily (Forward and backwards)
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Move forward between words
map H b
map L w
" Commands
map QQ :x <Enter>
map U <C-r> " Redo
" map ' $ 

"""""""""Plugin configurations"""""""""""

let g:airline_theme='monokai_tasty'
let g:ale_linters = {'python': ['flake8']}
