" Install plugins with plugin manager: 
" https://github.com/junegunn/vim-plug/blob/master/plug.vim
" :PlugInstall
" Dependencies : Git
"
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive' " Vim+Git
" Plug 'morhetz/gruvbox'
" Plug 'nikolvs/vim-sunbather'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale' " Static analysis and coding feedback
" https://github.com/dense-analysis/ale#installation-with-vim-plug
call plug#end()

" colorscheme gruvbox
" colorscheme sunbather
colorscheme vim-monokai-tasty " From JJ
set background=dark
au BufRead,BufNewFile *.md set filetype=markdown 
"au BufRead,BufNewFile *.md colorscheme murphy

set ic is hls
set relativenumber
set hidden		" Jump into open buffers without needing to save
set number
map <C-g> :Goyo 100<CR>
map <C-f> :Goyo!<CR>
inoremap kj <Esc>
map H b
map L w
map QQ :x <Enter>
map U <C-r> " Redo
" map ' $ " EOL

syntax on " highlight syntax
" set nowrap " Line wrapping: No new line when text gets to the end
set smartindent " indentation for code
set tabstop=4 softtabstop=4
" set number " show line numbers
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type
" set visualbell

let g:airline_theme='monokai_tasty'

let g:ale_linters = {'python': ['flake8']}
