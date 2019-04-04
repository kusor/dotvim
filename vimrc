" VIM configuration
set nocompatible                  " Must come first because it changes other options.
set modeline                      " Allow per file config

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set termguicolors                 " True color terminal

set expandtab                     " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set title                         " Set the terminal's title

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set list                          " Display line-end chars.
set listchars=tab:▸\ ,eol:¬       " TextMate like tabs and end of lines.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

"-- FOLDING --

" Folding
set foldenable
set foldmethod=syntax
" Don't autofold anything
set foldlevel=100

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=20
    syn region foldBraces start=/{$/ end=/^\s*}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4

" Handle plugins as packages with minpac
packadd minpac
call minpac#init()
" Couple custom commands to deal with package install/remove:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" Here come the real plugins:
" call minpac#add(gh-user/gh-plugin-repo)
call minpac#add('morhetz/gruvbox')
colorscheme gruvbox

set guifont=Monaco:h14            " Font family and font size.
set encoding=utf-8                " Use UTF-8 everywhere.

call minpac#add('vim-syntastic/syntastic')
call minpac#add('scrooloose/nerdtree')
call minpac#add('w0rp/ale')
call minpac#add('airblade/vim-rooter')
call minpac#add('mileszs/ack.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('vim-scripts/AutoClose')

call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('tomtom/tlib_vim')
call minpac#add('garbas/vim-snipmate')

call minpac#add('honza/vim-snippets', {'type': 'opt'})

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

"ALE Linter
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

" rust specific
let g:rustfmt_autosave = 1

" Write current buffer to scrum server
command! Scrum execute "%!/Users/pedropc/work/engdoc/roadmap/bin/scrum -u pedro -f"
