set encoding=utf-8
autocmd! bufwritepost .vimrc source %
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
"Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'plasticboy/vim-markdown'
Plugin 'PProvost/vim-ps1'
Plugin 'OrangeT/vim-csharp'
Plugin 'vim-scripts/dbext.vim'
Plugin 'unblevable/quick-scope'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'fsharp/vim-fsharp'
Plugin 'purescript-contrib/purescript-vim'
Plugin 'neoclide/coc.nvim'
Plugin 'LnL7/vim-nix'
"Plugin 'frigoeu/psc-ide-vim'
Plugin 'lifepillar/pgsql.vim'

call vundle#end()

filetype plugin on
filetype plugin indent on
syntax on

set pastetoggle=<F2>
set clipboard^=unnamed,unnamedplus

set mouse=a
set backspace=indent,eol,start

set showcmd

set dir=/tmp//
set scroll=16
set scrolloff=4
set laststatus=2
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = 'Ξ'

let mapleader=","

" quick leave insert mode
inoremap kj <Esc>

" quick save command
noremap <Leader>w :write<CR>
noremap <Leader>s :write<CR>
"vnoremap <Leader>s <C-C>:update<CR>
"inoremap <Leader>s <C-O>:update<CR>

" quick reload file
noremap <Leader>r :edit<CR>

" keyword searching
set hlsearch
set ignorecase
set smartcase

" faster comma
noremap ,, ,

" quick close command
noremap <Leader>e :quit<CR>

" quick open new tab
noremap <Leader>c :tabnew<CR>

" easy sort list
vnoremap <Leader>s :sort<CR>

noremap <leader>q :noh<CR>

" easily format paragraphs
vmap Q gq
nmap Q gqap

" quick switch tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map gr <esc>:tabprevious<CR>

" split config
set splitbelow
set splitright
set winheight=15
au VimEnter * set winminheight=7
au VimEnter * set winheight=999

map <Space>s <C-W>J
map <Space>v <C-W>L

" easy move between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" easy resize splits
"nnoremap <silent> + :resize +7<CR>
"nnoremap <silent> - :resize -7<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" toggle line wrap
noremap <F9> :set wrap!<CR>

" Macro to delete whitespace
map <Leader>W :%s/\s\+$//

" Color Scheme stuff
set t_Co=256
"color wombat256mod
color molokai
let s:molokai_original=1
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set timeoutlen=800
set wildmode=list:longest

" auto close the preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" set path
if filereadable("./node_modules/.bin/purs")
    let $PATH .= ':./node_modules/.bin/'
endif

"""
" Plugin Stuff
"""

" Settings for fugitive
nnoremap <Leader>gs :G<CR>

" Settings for ctrlp
let g:ctrlp_max_height=30
let g:ctrlp_custom_ignore = 'dist\|node_modules\|target\|bower_components\|output'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-p>'],
    \ 'AcceptSelection("v")': ['<c-v>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = '' " don't use git root as working path
set wildignore+=*.pyc
set wildignore+=*_build/*,**/dist-newstyle/*
set wildignore+=*.o

" settings for taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" settings for syntastic
"let g:syntastic_cpp_include_dirs = ['/usr/include/qt4/QtGui']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" settings for supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x\<lt>c-o>")<cr>
    endif
endif
let g:haskellmode_completion_ghc = 1
let g:haskell_indent_where = 0

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" set up browser for haskell_doc.vim
let g:haddock_browser = "firefox"

" NERDTree options
noremap <Leader>/ :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" vim-markdown options
map <Plug> <Plug>Markdown_MoveToCurHeader

" ghcmod-vim options
"noremap <Leader>tq :GhcModType<CR>
"noremap <Leader>tw :GhcModTypeInsert<CR>

" dbext.vim options
let g:dbext_default_profile_prof_name = 'type=SQLSRV:integratedlogin=1:srvname=hostname:dbname=dbname'

" vim-fsharp options
let g:fsharp_only_check_errors_on_write = 1
let g:fsharp_map_prefix = 'cp'

" pgsql.vim gettings
gu BufNewFile,BufRead *.psql let b:sql_type_override='pgsql' | setfiletype sql

" purescript settings
"autocmd FileType purescript noremap <Leader>t :call CocAction('doHover')<CR>
autocmd FileType purescript noremap <Leader><space> :CocList symbols<CR>

" haskell settings
"autocmd FileType haskell noremap <Leader>t :call CocAction('doHover')<CR>
autocmd FileType haskell noremap <Leader><space> :CocList symbols<CR>

nnoremap <silent> <Leader>t :call <SID>show_documentation()<CR>

nnoremap <Leader>t :call show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""
" hexmode stuff
"""
" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
if !exists("*ToggleHex")
  function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
      " save old options
      let b:oldft=&ft
      let b:oldbin=&bin
      " set new options
      setlocal binary " make sure it overrides any textwidth, etc.
      silent :e " this will reload the file without trickeries 
                "(DOS line endings will be shown entirely )
      let &ft="xxd"
      " set status
      let b:editHex=1
      " switch to hex editor
      %!xxd
    else
      " restore old options
      let &ft=b:oldft
      if !b:oldbin
        setlocal nobinary
      endif
      " set status
      let b:editHex=0
      " return to normal editing
      %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
  endfunction
endif

