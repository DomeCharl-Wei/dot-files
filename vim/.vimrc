" >^.^<
" syntax highlighting
" set background=dark
syntax on
" color mango


set nocompatible
filetype plugin on

" vimwiki plugin
let g:vimwiki_use_mouse = 1
let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h2,h4,h5,h6,pre,script,style'
let g:vimwiki_list = [{
\ 'path': '/mnt/store/workspace/dev/githome/cswei99-s-blog/wikifiles',
\ 'path_html': '/mnt/store/workspace/dev/githome/cswei99-s-blog/html',
\ 'template_path': '/mnt/store/workspace/dev/githome/cswei99-s-blog/html/templates/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'auto_export': 1,
\ 'nested_syntaxes': {'Clang': 'c', 'Ruby': 'ruby', 'JS': 'javascript', 'Coffee': 'coffee', 'SQL': 'sql', 'Bash': 'sh', 'Vim': 'vim', 'CSS': 'css', 'HTML': 'html', 'XML': 'xml'}}]


" syntax trigger
" command: ;s
function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction

nmap <silent> ;s :call ToggleSyntax()<CR>

" capitalize 
" command: ;c 
function! CapitalizeCenterAndMoveDown()
	s/\<./\u&/g
	center
	+1
endfunction

nmap <silent> ;c :call CapitalizeCenterAndMoveDown()<CR>

" current time 
" command: ;t
function! CurrentTime()
	let str = strftime('%T')
	:execute "normal i" . str . "\<Esc>"
endfunction
nmap <silent> ;t :call CurrentTime()<CR>

" current day
" command: ;d
function! CurrentDay()
	let str = strftime('%y-%m-%d')
	:execute "normal i" . str . "\<Esc>"
endfunction
nmap <silent> ;d :call CurrentDay()<CR>

" show current time in the bottom
" command: ;h
function! ShowCurrentTime()
	echo strftime('%c')
endfunction
nmap <silent> ;h : call ShowCurrentTime()<CR>

" Vimwiki2HTML key map
nmap ;f :Vimwiki2HTML<CR>

" append '"' 
function! AutoAppendDoubleQuote()
    let str = '"'
    :execute "normal Bi" . str . "\<Esc> Ea" . str . "\<Esc>"
endfunction
nmap <silent> ;" : call AutoAppendDoubleQuote()<CR>

function! AutoAppendSingleQuote()
    let str = "'"
    :execute "normal Bi" . str . "\<Esc> Ea" . str . "\<Esc>"
endfunction
nmap <silent> ;' : call AutoAppendSingleQuote()<CR>

" append '<>' 
function! AutoAppendBrackets()
    let str0 = '<'
    let str1 = '>'
    :execute "normal Bi" . str0 . "\<Esc> Ea" . str1 . "\<Esc>"
endfunction
nmap <silent> ;> : call AutoAppendBrackets()<CR>



let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
function! CustomToggleTlist()
    :execute ":Tlist"
endfunction
nmap <silent> ;l : call CustomToggleTlist()<CR>


" append string likes '/*    */'
function! AppendCStyleComment()
    let s:str = '/*    */'
    :execute "normal i" . s:str . "\<Esc>2hi"
endfunction
nmap <silent> ;cc : call AppendCStyleComment()<CR>

function! SelectOneWord()
    :execute "normal bve"
endfunction
nmap <silent> ;sw : call SelectOneWord()<CR>


" vim-diff plugin settings
set runtimepath+=/home/leowanta/.vim/autoload/
set diffexpr=diff#diffexpr()



" file encoding
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

" smart table
set smarttab

" supported that copy things out to X
" set mouse=r

" map "+ c
" cy copy text to system clipboard 
" cp paste text of "+ register to current position
vmap c "+
map c "+

" map vimgrep 
map gp :vimgrep //j **/*<C-f>7hi
map glp :vimgrep //j ./*<C-f>6hi
" next
map c. :cn<CR>
" prev
map c, :cprev<CR>
" open quicklist
map co :copen<CR>
" preview the results of vimgrep
map pv <CR><C-w>w


" define a highlight group HLCurrentWord
" highlight the current word
highlight HLCurrentWord term=bold ctermfg=Cyan guifg=bold
match HLCurrentWord /\k*\%#\k*/


" set line number
set nu
set ruler
" set tabstop = 4
set shiftwidth=4
set expandtab
set tabstop=4

" cindent
filetype indent on
set ci
