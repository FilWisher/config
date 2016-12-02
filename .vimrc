"from substack

let mapleader="," 
set autoindent
set indentexpr=off 
set tabstop=2
set nohls
set expandtab
set shiftwidth=2
set wildmenu
set switchbuf+=useopen

set clipboard=unnamedplus

set wmh=0
set number
set ruler
set sw=2
set noshowmatch
syntax enable
set background=light
set nospell
autocmd VimEnter * set vb t_vb=
filetype on
 
set modeline
set nojoinspaces " pesky 2-spaces after the period thing
set shortmess=at " I hate: naggy dialogs, intros, long messages
set noshowcmd
 
set nowritebackup
set noswapfile
set nobackup

" yeah
map ; :

" switch window
map <Leader>l <C-w>l
map <Leader>h <C-w>h
map <Leader>k <C-w>k
map <Leader>j <C-w>j

" don't delete whitespace-only lines leaving insert mode:
inoremap <CR> x<BS><CR>x<BS>
inoremap <up> x<BS><up>
inoremap <down> x<BS><down>
nnoremap o ox<BS>
nnoremap O Ox<BS>

"buffer shortcuts 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blist<CR>

"tab shortcuts (CTRL-n next; CTRL-p prev)
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-x> :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
"nnoremap <silent> <C-g> ]b :bnext<CR>
"nnoremap <silent> <C-g> [B :bfirst<CR>
"nnoremap <silent> <C-g> ]B :blist<CR>

"start opening file with C-f
nnoremap <Leader>f :e<Space>
nnoremap <Leader>b :b<Space>

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
nnoremap <Leader>t  :tag 
nnoremap <Leader>tn  :tn<CR>
nnoremap <Leader>tp  :tp<CR>
nnoremap <Leader>ts  :ts<CR>
nnoremap <Leader>tf  :tf<CR>
nnoremap <Leader>tl  :tl<CR>

"" make facilities
nnoremap <Leader>m :call g:Run('mk')<CR>
nnoremap <Leader>r :call g:Run('mk run')<CR>

function! Run(cmd)
  let bytecode = system(a:cmd)
  split __Run__
  normal! ggdG
  setlocal filetype=run_results
  setlocal buftype=nofile
  
  call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <Leader>q <C-w>c
nnoremap <Leader>x :bp\|bd#<CR>

" 2-space indent for html and json files
autocmd BufRead,BufNewFile *.json,*.html,*.css,*.svg set sw=2 tabstop=2 expandtab
autocmd BufRead,BufNewFile *.go,mkfile,Makefile,makefile,*Makefile,*makefile set noexpandtab
autocmd BufRead,BufNewFile *.lua,*.c,*.h,*.go,Makefile,makefile,mkfile set sw=4 tabstop=4 noexpandtab

set backupdir=/tmp
set directory=/tmp

" git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush 

nnoremap <Leader>K Vxkkp
nnoremap <Leader>J Vxp

nnoremap <leader>e :Eval<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" map <Leader>p :!xargs plumb &2>/dev/null<CR>
vnoremap <silent> <Leader>p :call g:PlumbV()<CR>
nnoremap <silent> <Leader>p :call g:PlumbN()<CR>
nnoremap <Leader>c :call g:CmdPanel()<CR>
vnoremap <silent> <Leader>s :call g:Test()<CR>
nnoremap <Leader># :buffers<CR>

vnoremap <silent> <Leader>C !pandoc -f markdown -t latex<CR>

" checks if argument is bash fn
function! IsFn(cmd)
  let result = system('type ' . a:cmd)
  if v:shell_error
    return 0
  else
    return 1
  endif
endfunction

function! CmdPanel()
  new cmdpanel
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap nonumber buflisted
  call bufname("cmdpanel")
  normal K
  :resize 5<CR>
endfunction

"function! CmdPanel()
"  echo "hehe"
"	normal! :5new cmdpanel<CR>
"	"setlocal filetype=cmdpanel
"	"setlocal buftype=nofile
"	"setlocal bufhidden=hide
"	"setlocal noswapfile
"	"winheight(5)
"endfunction

" run command in new window
function! RunCmd(cmd)
  let stdout = system(a:cmd)
  normal! :e untitled<CR>
  normal! ggdG
  setlocal filetype=run_results
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  call append(0, split(stdout, '\v\n'))
endfunction

function! PlumbN()
  call g:Plumb(expand("<cWORD>"))
endfunction

" run command or pass to plumber
function! PlumbV()
  normal! gv"zy
  call g:Plumb(@z)
endfunction

function! Plumb(expr)
  if g:IsFileOrDir(a:expr)
    call g:HandleFileOrDir(a:expr)
  elseif g:IsFn(a:expr)
    call g:RunCmd(a:expr)
  else
    call system("plumb " . a:expr . " &>/dev/null")
    redraw!
  endif
endfunction

function! IsFileOrDir(expr)
  if g:TestFile(a:expr, '-r')
    return 1
  elseif g:TestFile(a:expr, '-d')
    return 1
  else
    return 0
  endif
endfunction

function! TestFile(expr, type)
  let result = system('test ' . a:type . ' ' . a:expr)
  if v:shell_error
    return 0
  else
    return 1
  endif
endfunction

function! HandleFileOrDir(expr)
  if g:TestFile(a:expr, '-d')
    call g:RunCmd('ls ' . a:expr)  
  elseif g:TestFile(a:expr, '-r')
    normal! gf 
  endif
endfunction

"""""""""""""" colors

highlight! Normal guibg=bg guifg=#ffffea ctermbg=230 ctermfg=232
highlight! NonText guibg=bg guifg=#ffffea ctermbg=bg ctermfg=230
highlight! StatusLine guibg=#eaffff guifg=#000000 ctermbg=black ctermfg=DarkCyan
highlight! Comment cterm=italic
