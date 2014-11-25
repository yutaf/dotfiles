" bundle
source ~/.vimrc.bundle

" tabline
source ~/.vimrc.tabline

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
colorscheme solarized

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
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7

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

" クリップボード
"set clipboard+=unnamed

" alphabet increment
set nf=alpha
