
"         _     _ _       _       _ _         _           
" _ __  (_) __| ( )___  (_)_ __ (_) |___   _(_)_ __ ___  
"| '_ \ | |/ _` |// __| | | '_ \| | __\ \ / / | '_ ` _ \ 
"| | | || | (_| | \__ \ | | | | | | |_ \ V /| | | | | | |
"|_| |_|/ |\__,_| |___/ |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"     |__/                                               

" 1) PLUG_IN SECTION

call plug#begin('~/.local/share/nvim/plugged')

"    Put all the plug ins here.
" COMPLETION & CODE HELPERS
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
Plug 'plasticboy/vim-markdown'

" STRUCTURE
Plug 'vim-airline/vim-airline'
Plug  'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" SCHEMES and THEMES
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'flazz/vim-colorschemes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Rigellute/rigel'
"  Always use DEVICONS as the last one
Plug 'ryanoasis/vim-devicons'

call plug#end()

" 2) PLUG IN SETTINGS

" Make DEOPLATE on all the time
let g:deoplete#enable_at_startup = 1
" Close top window on code complete in DEOPLETE when finished
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" disable JEDI autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the JEDI go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Make NEOMAKE the python linter
let g:neomake_python_enabled_makers = ['pylint']
" Make NEOMAKE work when writing a buffer only ( fast )
call neomake#configure#automake('w')

" Choose theme for AIRLINE
let g:airline_theme='dark'
"  Don't Display all AIRLINE buffers when only one tab open.
let g:airline#extensions#tabline#enabled = 0
" Fancy POWERLINE symbols
let g:airline_powerline_fonts = 1

" NERDTREE open at startup
" autocmd vimenter * NERDTree
" NERDTREE opens in the current folder
set autochdir
let NERDTreeChDirMode=2
nnoremap \n :NERDTree .<CR>

" CTRL-P  Set the working directory as the dir of the current file
let g:ctrlp_working_path_mode =  'c'
" CTRL-P Search by filename not path. (Can toggle using <C-d>
let g:ctrlp_by_filename = 1
" CTRL-P to scan for dotfiles and dotdirs:
let g:ctrlp_show_hidden = 1
" CTRL-P opens file as a tab when <C-y> is pressed
let g:ctrlp_open_new_file = 't'

" COLORSCHEME
syntax enable
colorscheme rigel


" 3) OTHER CONFIGs. 

"-------------USER INTERFACE--------------------

" RELATIVE LINE NUMBERING 
set number
set relativenumber

" SYNTAX HIGHLIGHTING
syntax on 

"HIGHLIGHT THE LINE YOU ARE ON.
set cursorline

"TURN ON FILETYPE DETECTION AND LOADS SPECIFIC FILES BASED ON THAT.
filetype indent on

"ENHANCE AUTOCOMPLETES
set wildmenu


"-------------SEARCHING-------------------------

" ASYNCHRONOUS SEARCH IN REALTIME.
set incsearch

" MATCHES ARE HIGHLIGHTED.
set hlsearch

"------------FOLDING----------------------------
set modifiable

" FOLDING = ON
":wset unfoldenable
"set foldmethod=indent

" Read : help foldmethod to find out about foldmethods.
" Other commands are foldlevelstart ( value of 0 (all closed) and 99 (all open))
" and foldnestmax -- usually 0-10 is usable. 

"-----------WRAPPING-------------------------

set wrap
set nolinebreak
" List disables linebreak
set nolist
set textwidth=0
set wrapmargin=5


"------------ALIASES, KEYBINDINGS AND MOVEMENT---

" HIGHLIST THE LAST INSERTED TEXT
nnoremap gV `[v`]

" jk IS ESCAPE
inoremap jk <esc>

" MOVE FOCUS BETWEEN WINDOWS
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" RESIZE WINDOWS
map <C-i> <C-w>+    "increase
map <C-s> <C-w>-    "smaller

" Ctrl + n to TOGGLE NERDTREE
map <C-n> :NERDTreeToggle<CR>











