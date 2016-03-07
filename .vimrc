"from substack

let mapleader="," 
set autoindent
set indentexpr=off 
set tabstop=2
set expandtab
set shiftwidth=2
set wildmenu

set clipboard=unnamedplus

set wmh=0
set number
set sw=2
set nohls
set noshowmatch
syntax enable
setlocal spell spelllang=en_us
set nospell
set background=dark
autocmd VimEnter * set vb t_vb=
 
set modeline
set nojoinspaces " pesky 2-spaces after the period thing
set shortmess=at " I hate: naggy dialogs, intros, long messages
set noshowcmd
 
set nowritebackup
set noswapfile
set nobackup

" don't delete whitespace-only lines leaving insert mode:
inoremap <CR> x<BS><CR>x<BS>
inoremap <up> x<BS><up>
inoremap <down> x<BS><down>
nnoremap o ox<BS>
nnoremap O Ox<BS>

"buffer shortcuts (CTRL-n next; CTRL-p prev; CTRL-c close)
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-c> :bp\|bd#<CR>

"start opening file with C-f
nnoremap <C-f> :e<Space>
nnoremap <Leader>f :b<Space>

" ESC key
inoremap <C-g> <Esc>
onoremap <C-g> <Esc>
cnoremap <C-g> <Esc>
vnoremap <C-g> <Esc>

" split window
vnoremap <C-w>s :vsplit<CR>
inoremap <C-w>s :vsplit<CR>
nnoremap <C-w>s :vsplit<CR>
vnoremap <C-w>o :split<CR>
inoremap <C-w>o :split<CR>
nnoremap <C-w>o :split<CR>

" switch window
vnoremap <Tab> <C-w>l
nnoremap <Tab> <C-w>l
vnoremap <S-Tab> <C-w>h
nnoremap <S-Tab> <C-w>h

" swap between .c and .h
nnoremap <Leader>n :A<CR>
vnoremap <Leader>n :A<CR>

" ctags
nnoremap <Leader>ct :!ctags -R .<CR>
nnoremap <Leader>t  :tag 
nnoremap <Leader>tn  :tn<CR>
nnoremap <Leader>tp  :tp<CR>
nnoremap <Leader>ts  :ts<CR>
nnoremap <Leader>tf  :tf<CR>
nnoremap <Leader>tl  :tl<CR>

" 2-space indent for html and json files
autocmd BufRead,BufNewFile *.json,*.html,*.css,*.svg set sw=2 tabstop=2
autocmd BufRead,BufNewFile mkfile,Makefile,makefile,*Makefile,*makefile set noexpandtab

let g:vimfiler_as_default_explorer = 1

set backupdir=/tmp
set directory=/tmp

" git
nnoremap <Leader>gs :!git status<CR>

nnoremap <Leader>k Vxkkp
nnoremap <Leader>j Vxp

" pathogen
call pathogen#infect()
call pathogen#helptags()

let g:ctrlp_map = '<c-a>'

filetype plugin indent on
nnoremap <leader>e :Eval<CR>

autocmd BufWinLeave * mkview!
autocmd BufWinEnter * silent loadview

