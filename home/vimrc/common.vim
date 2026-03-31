" mouse
set mouse=n
set mouse=i
set mouse=c
set mouse=h
set mouse=r

" backspace
set backspace=start,eol

" colorscheme
syntax enable
set background=dark

set cursorline
set number

" For special characters ex. TAB, WHITE SPACE...
set lcs=tab:>.,trail:_,extends:\
set list

" tab key
set tabstop=2
set shiftwidth=2
set expandtab

" autocmd 自動コメントアウト
autocmd FileType * setlocal formatoptions-=ro

" 検索の折り返しをしない
set nowrapscan

" ステータスラインを常に表示
set laststatus=2
" ステータスラインの内容
set statusline=%F%r%h%=

" alphabet increment
set nf=alpha

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" sql
let g:sql_type_default='mysql'

" -------------------------------
" tabline
" -------------------------------
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
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
" 常にタブラインを表示
set showtabline=2

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

" -------------------------------
" php
" -------------------------------
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" -------------------------------
" vim-instant-markdown
" -------------------------------
let g:instant_markdown_autostart = 0
nmap gm :InstantMarkdownPreview<CR>

" -------------------------------
" c
" -------------------------------
autocmd FileType c setlocal shiftwidth=4 tabstop=4

" emmet
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }
