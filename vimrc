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

" Check if files have been modified externally
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif

function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal expandtab ts=4 sts=4 sw=4
autocmd FileType javascriptreact setlocal expandtab ts=4 sts=4 sw=4
autocmd FileType json setlocal expandtab ts=4 sts=4 sw=4

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
"colorscheme atom
set guifont="Monaco for Powerline":h14 " Font family and font size.
set encoding=utf-8                " Use UTF-8 everywhere.

" minpac to handle itself:
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('vim-syntastic/syntastic')
call minpac#add('scrooloose/nerdtree')
" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

call minpac#add('w0rp/ale')
call minpac#add('airblade/vim-rooter')
call minpac#add('mileszs/ack.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')
call minpac#add('vim-scripts/AutoClose')

call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('tomtom/tlib_vim')

call minpac#add('garbas/vim-snipmate')
let g:snipMate = { 'snippet_version' : 0 }

call minpac#add('honza/vim-snippets', {'type': 'opt'})
" Change <tab> to <ctrl+j> to trigger snippets, since the
" tab is used by YCM
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

call minpac#add('tpope/vim-fugitive')

""call minpac#add('Valloric/YouCompleteMe')
call minpac#add('fatih/vim-go')

call minpac#add('mattn/webapi-vim')
call minpac#add('mattn/vim-gist')

call minpac#add('hashivim/vim-terraform')
call minpac#add('jparise/vim-graphql')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')


if has('nvim')
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

  call minpac#add('iamcco/markdown-preview.nvim', {'do': 'packloadall! | call mkdp#util#install()'})

  " LSP support
  call minpac#add('neovim/nvim-lspconfig')
  packadd nvim-lspconfig
  call minpac#add('tjdevries/lsp_extensions.nvim')
  packadd lsp_extensions.nvim
  call minpac#add('nvim-lua/completion-nvim')
  packadd completion-nvim
  call minpac#add('nvim-lua/lsp-status.nvim')
  packadd lsp-status.nvim

  " Telescope
  call minpac#add('nvim-lua/popup.nvim')
  packadd popup.nvim
  call minpac#add('nvim-lua/plenary.nvim')
  packadd plenary.nvim
  call minpac#add('nvim-telescope/telescope-fzy-native.nvim')
  call minpac#add('nvim-telescope/telescope.nvim')
  " TreeSitter
  call minpac#add('nvim-treesitter/nvim-treesitter')
  " This would run updates everytime nvim runs. Let's just run manually
  " instead
  " call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
  packadd nvim-treesitter
  lua require('plugins.treesitter')
  " Telescope.nvim, see lua/plugins/telescope.lua
  lua require('plugins.telescope')

  " Set completeopt to have a better completion experience
  " :help completeopt
  " menuone: popup even when there's only one match
  " noinsert: Do not insert text until a selection is made
  " noselect: Do not select, force user to select one from the menu
  set completeopt=menuone,noinsert,noselect

  " Avoid showing extra messages when using completion
  set shortmess+=c

  " Configure LSP
  lua require('lsp')

  sign define LspDiagnosticsErrorSign text=❌  linehl= texthl=LspDiagnosticsErrorSign numhl=
  sign define LspDiagnosticsWarningSign text=⚠️   linehl= texthl=LspDiagnosticsWarningSign numhl=
  sign define LspDiagnosticsInformationSign text=ℹ️  linehl= texthl=LspDiagnosticsInformationSign numhl=
  sign define LspDiagnosticsHintSign text=⁉️  linehl= texthl=LspDiagnosticsHintSign numhl=

  let g:diagnostic_enable_virtual_text = 1
  " Do not show diagnostic in insert mode
  let g:diagnostic_insert_delay = 1
  " End of LSP
end

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set this. Airline will handle the rest.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'
" set t_Co=256
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

let g:airline_theme='gruvbox'
" let g:airline_theme='solarized'
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
""let g:ycm_min_num_of_chars_for_completion = 4
""let g:ycm_min_num_identifier_candidate_chars = 4
""let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
""set completeopt-=preview
""let g:ycm_add_preview_to_completeopt = 0
" It is the default but I keep forgetting:
""let g:ycm_key_list_stop_completion = ['<C-y>']

" Handlebars.js syntax:
call minpac#add('mustache/vim-mustache-handlebars')

" rust specific
let g:rustfmt_autosave = 1

" Taken from https://github.com/rust-lang/rust.vim/issues/130
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

""let g:ycm_language_server =
""\ [
""\   {
""\     'name': 'rust',
""\     'cmdline': ['rust-analyzer'],
""\     'filetypes': ['rust'],
""\     'project_root_files': ['Cargo.toml']
""\   }
""\ ]

let g:ale_linters = {'rust': ['analyzer']}

if has('nvim')
  " Go lang
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  let g:go_auto_sameids = 0
  let g:go_fmt_command = "goimports"
  let g:go_auto_type_info = 1
endif

" vim-gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" Write current buffer to scrum server
command! Scrum execute "%!MANTA_USER=Joyent_Dev /Users/pedropc/work/engdoc/roadmap/bin/scrum -u pedro -f"

" Markdown:
let g:markdown_fenced_languages = ['javascript', 'python', 'bash=sh', 'go', 'ruby', 'rust', 'graphql', 'sql']

" Custom completion keys
" Use TAB and S-TAB to navigate completion options
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" To make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Support JSON comments
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufNewFile,BufRead Jenkinsfile setf groovy

