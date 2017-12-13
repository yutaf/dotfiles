" bundle
if filereadable(expand('~/vimrc/.vimrc.bundle'))
  source ~/vimrc/.vimrc.bundle
endif

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
if isdirectory(expand('~/.vim/bundle/vim-colors-solarized'))
  colorscheme solarized
endif

" Syntax Highlight for BLACK background color
"syntax on
"highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
"highlight CursorLine term=none cterm=none ctermfg=black ctermbg=grey

set cursorline

" Show line nunber
set number

" For special characters ex. TAB, WHITE SPACE...
set lcs=tab:>.,trail:_,extends:\
set list
"highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
"highlight JpSpace cterm=underline ctermfg=7 guifg=7

" tab key
set tabstop=2
set expandtab

" autoindent
"set autoindent
set shiftwidth=2

" autocmd 自動コメントアウト
autocmd FileType * setlocal formatoptions-=ro

" 検索の折り返しをしない
set nowrapscan

" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容

" alphabet increment
set nf=alpha

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" sql
let g:sql_type_default='mysql'

""""""""""""""""
" tabline
""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
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
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

""""""""""""""""
" php
""""""""""""""""
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
