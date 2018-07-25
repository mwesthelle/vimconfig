" REQUIRED SETTINGS
" =================
set nocompatible              " be iMproved, required
filetype off                  " required

" LEADER MAPPING
" ==============
let mapleader=","

" CTRLP SETTINGS
" ==============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_mruf_relative = 1

if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" LINE NUMBER SETTING
" ===================
set relativenumber

" GLOBAL PLUGIN SETTINGS
" ======================
"let g:jedi#popup_on_dot = 0
let g:gutentags_cache_dir = '~/vimtags'

" STATUSLINE SETTINGS
" ===================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%{anzu#search_status()}

" SYNTASTIC SETTINGS
" ==================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'

" VUNDLE INITIALIZATION
" =====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs' 
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'crucerucalin/peaksea.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'unblevable/quick-scope' 
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'osyo-manga/vim-anzu'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'HendrikPetertje/vimify'
Plugin 'antoyo/vim-licenses'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'tpope/vim-surround'
Plugin 'lervag/vimtex'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" MATCHIT
" =======
runtime macros/matchit.vim

" AIRLINE SETTINGS
" ================
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" VIMIFY AUTHENTICATION TOKEN
" ===========================
let g:spotify_token='ZTQyNTY2NjFjMGNiNDAyMjhmMTM3OTA2YTZjNjRjNDM6NzFkY2E1YWUzMjRhNDE5MjgyN2JjNDM5ODk0NmI3M2E='

" NERDTREE SETTINGS
" ===================
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
nnoremap <F3> :NERDTreeToggle<cr>


" MAPPINGS
" ========
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>scb :set scrollbind!<cr>
noremap <Leader>s :update<CR>
nmap <CR> o<Esc>k
noremap <Leader>f :Autoformat<CR>
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" SUPERTAB SETTINGS
" =================
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" WINDOWS DON'T HURT MY EYES
" ==========================
if has("win32") || has("win64") || has("dos32")
	set guifont=Consolas:h12
" STUPID VIM DOESN'T RECOGNIZE MY LAYOUT CORRECTLY
" ================================================
	nnoremap <leader>t :tag <c-r><c-w><cr>
endif

" COLOR SCHEME
" ============
set background=dark
colorscheme moonfly

" ENABLE SYNTAX
" =============
syntax on

" TURN ON MOUSE SUPPORT
" =====================
set mouse=a

" CURSOR LINE HIGHLIGHT
" =====================
set cul

" START SEARCHING RIGHT AWAY
" ==========================
set incsearch

" SHOW ME SOME CONTEXT WHEN I SCROLL
" ==================================
set scrolloff=2

" ENCODING
" ========
set encoding=utf-8

" DETECT FILE CHANGES AND RELOAD ACCORDINGLY
" ==========================================
set autoread

" FILETYPE SETTINGS
" =================
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=0 nomodeline
autocmd FileType json setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType yaml setl expandtab tabstop=2 shiftwidth=2 softtabstop=0


" LARGE FILE SETTINGS
" ===================
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
	autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
augroup END

" LICENSE SETTINGS
" ================
let g:licenses_authors_name = 'Westhelle, Matheus <matheus.westhelle@inf.ufrgs.br'
let g:licenses_copyright_holders_name = 'Westhelle, Matheus <matheus.westhelle@inf.ufrgs.br'
let g:licenses_default_commands = [ 'gpl', 'mit', 'apache' ]
