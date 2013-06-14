set nocompatible
filetype plugin on
set bg=dark
syntax on

" Learnings
let mapleader = ","
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>

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

               "#'lorem' "ipsum" etc "whatever"
