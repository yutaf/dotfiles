set mouse=n
set mouse=i
set mouse=c
set mouse=h
set mouse=r

set backspace=start,eol

syntax enable
set background=dark
set cursorline
set number

set lcs=tab:>.,trail:_,extends:\
set list

set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType * setlocal formatoptions-=ro

set nowrapscan

set laststatus=2
set statusline=%F%r%h%=

set nf=alpha

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:sql_type_default='mysql'

function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

nnoremap [Tag] <Nop>
nmap t [Tag]

for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

let g:instant_markdown_autostart = 0
nmap gm :InstantMarkdownPreview<CR>

autocmd FileType c setlocal shiftwidth=4 tabstop=4

let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }
