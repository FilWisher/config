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
set shortmess=AITstW " I hate: naggy dialogs, intros, long messages
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
inoremap <C-g> <C-c>
onoremap <C-g> <C-c>
cnoremap <C-g> <C-c>
vnoremap <C-g> <C-c>

" swap between .c and .h
nnoremap <Leader>n :A<CR>
vnoremap <Leader>n :A<CR>

" ctags
nnoremap <Leader>ct :!ctags -R .<CR>
nnoremap <leader>t  :tag 
nnoremap <leader>tn  :tn<CR>
nnoremap <leader>tp  :tp<CR>
nnoremap <leader>ts  :ts<CR>
nnoremap <leader>tf  :tf<CR>
nnoremap <leader>tl  :tl<CR>

" fuck everything about the 'Press ENTER' message:
set showcmd
set shortmess=at
 
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

