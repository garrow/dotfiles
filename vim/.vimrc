execute pathogen#infect()
set nocompatible
filetype plugin on
set bg=light
syntax on
set encoding=utf-8
set guifont=Inconsolata-g:h16

" Enable mouse in visual mode
" set mouse=n
" Show partially completed command sequences in bottom row.
set showcmd

" Learnings
let mapleader = ","
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>

" Indentation
set softtabstop=2
set shiftwidth=2
set expandtab

" Allow backspace in insert mode over the current INSERT mode session.
set backspace=indent,eol,start

" Unlearning bad habits
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <left> <nop>

" Abbreviations
iabbrev @@ garrow.bedrossian@gmail.com
iabbrev gkb Garrow Bedrossian

" Wrap quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Comments
autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>

" StatusLine
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" Enable automagic indentation
" set smartindent
set autoindent

filetype indent on

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight long lines
"
"set colorcolumn=120
"highlight ColorColumn ctermbg=black
 " highlight NonText ctermfg=0 guifg=#4a4a59
 " highlight SpecialKey guifg=#4a4a59



set listchars=tab:▸\ ,eol:¬
" Ensure the gitgutter uses the same colours as LineColumn
highlight clear SignColumn
",trail:\·,extends:$,nbsp:=
" set listchars=tab:»\·,trail:\·,extends:$,nbsp:=


" Split window behaviour
set splitbelow
set splitright


" Toggle relativenumber
nnoremap <leader>r :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>

" Setup word wrapping
set linebreak " Don't wrap in the middle of words

" Enable semicolon ex commands
nnoremap ; :

" Marked Preview
:nnoremap <leader>m :silent !open -a Marked2.app '%:p'<cr>
" Markdown Table Thing
command! MarkdownHeader execute 'normal Yp' | MarkdownTableRow
command! MarkdownTableRow s/[^|]/-/g
command! MarkdownColumnCount s/\v\|//eng

" ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Disable gitgutter
let g:gitgutter_enabled = 0
