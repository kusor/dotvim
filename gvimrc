" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set antialias                     " MacVim: smooth fonts.
set guioptions-=T                 " Hide toolbar.
" set background=light              " Background.
set lines=50 columns=140          " Window dimensions.

" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar

" colorscheme railscasts
colorscheme gruvbox
let NERDTreeWinSize=40

nmap <leader>fs :so ~/.gvimrc.fullscreen<cr>
nmap <leader>sf :so ~/.gvimrc<cr>
