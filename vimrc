syntax on
filetype plugin indent on

set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set nocompatible
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set autoindent
set undofile
set incsearch
set path+=**
set wildmenu
set showcmd
set novisualbell
set wildmode=longest,list,full
set splitright splitbelow
set fileformat=unix                                                             
set encoding=utf-8                                                              
set fileencoding=utf-8
set colorcolumn=110
set background=dark
set lbr
set tw=500

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

highlight ColorColumn ctermbg=0 guibg=lightgrey

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'puremourning/vimspector'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'WolfgangMehner/c-support'
Plug 'Chiel92/vim-autoformat'
call plug#end()


autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

let NERDTreeIgnore = ['\.pys$', '__pycache__']
let NERDTreeNiminalUI = 1
let g:nerdtree_open = 0
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

if has("vms")
    set nobackup
else
    set backup
endif

let g:vimspector_enable_mappings = 'HUMAN'

colorscheme gruvbox

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let g:C_UseTool_cmake = 'Yes'
let g:C_UseTool_doxygen = 'Yes'

