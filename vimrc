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
set listchars=tab:▸\ ,eol:¬,trail:¶       " TextMate like tabs and end of lines. Highlight extra whitespace
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
autocmd FileType markdown setlocal expandtab ts=4 sts=4 sw=4

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

" minpac to handle itself:
call minpac#add('k-takata/minpac', {'type': 'opt'})
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
" Change <tab> to <ctrl+j> to trigger snippets, since the
" tab is used by YCM
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

call minpac#add('tpope/vim-fugitive')

call minpac#add('Valloric/YouCompleteMe')

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

" This automatically fix stuff
"let g:ale_fix_on_save = 1

" YOU Complete Me
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" It is the default but I keep forgetting:
let g:ycm_key_list_stop_completion = ['<C-y>']

" Handlebars.js syntax:
call minpac#add('mustache/vim-mustache-handlebars')

" rust specific
let g:rustfmt_autosave = 1

" Taken from https://github.com/rust-lang/rust.vim/issues/130
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

" Write current buffer to scrum server
command! Scrum execute "%!/Users/pedropc/work/engdoc/roadmap/bin/scrum -u pedro -f"
