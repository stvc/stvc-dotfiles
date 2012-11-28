set encoding=utf-8
autocmd! bufwritepost .vimrc source %
set nocompatible

filetype off
filetype plugin indent on
syntax on

set pastetoggle=<F2>
set clipboard=unnamed

set mouse=a
set backspace=indent,eol,start

let mapleader=","

" quick leave insert mode
inoremap kj <Esc>

" quick save command
noremap <Leader>w :update<CR>
noremap <Leader>s :update<CR>
"vnoremap <Leader>s <C-C>:update<CR>
"inoremap <Leader>s <C-O>:update<CR>

" quick close command
noremap <Leader>e :quit<CR>

" easy sort list
vnoremap <Leader>s :sort<CR>

" easily format paragraphs
vmap Q gq
nmap Q gqap

" quick switch tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easy move between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Macro to delete whitespace
map <Leader>W :%s/\s\+$//

" Color Scheme stuff
set t_Co=256
color wombat256mod
"set background=dark
highlight Normal ctermbg=None

" Show whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/


" Line Numbers and Length
set number " show line numbers
set tw=79  " width of document
set nowrap " dont automatically wrap on load
set fo-=t  " dont automatically wrap when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" lots of undo
set history=700
set undolevels=700

" TAB setup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set smartindent

" Remove annoying bells
set noerrorbells
set visualbell t_vb=

" Code folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=-1

" Remeber file position
set viminfo='10,\"100,:20,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Misc
set showmatch
set ruler
set virtualedit=block
set timeoutlen=2000
set wildmode=list:longest

"""
" Plugin Stuff
"""

" Pathogen stuff for loading plugins
call pathogen#infect()

" Settings for vim-powerline
set laststatus=2
let g:Powerline_symblos='fancy'

" Settings for ctrlp
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*

" settings for taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
