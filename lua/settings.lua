local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')


utils.opt('o', 'title', true) -- Set the terminal's title
utils.opt('o', 'wildmenu', true) -- Enhanced command line completion.
utils.opt('o', 'showcmd', true) -- Display incomplete commands.
utils.opt('o', 'showmode', true) -- Display the mode you're in.
utils.opt('o', 'incsearch', true) --  Highlight matches as you type.
utils.opt('o', 'hlsearch', true) -- Highlight matches.

-- Autoread
utils.opt('o', 'autoread', true)

-- Folding
utils.opt('o', 'foldenable', true)
utils.opt('o', 'foldmethod', 'expr')
utils.opt('o', 'foldexpr', "nvim_treesitter#foldexpr()")
-- Don't autofold anything
utils.opt('o', 'foldlevel', 100)


utils.opt('w', 'list', true) -- Display line-end chars.
utils.opt('w', 'listchars', "tab:▸ ,eol:¬,trail:¶,nbsp:+") --  TextMate like tabs and end of lines. Highlight extra whitespace
utils.opt('o', 'backspace' , 'indent,eol,start') -- Intuitive backspacing.

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Golang auto import and format on save
-- Format on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

-- Import on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- Markdown fenced languages
-- Use proper syntax highlighting in code blocks
local fences = {
  "lua",
  "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "bash=sh",
  "console=sh",
  "html",
  "css",
  "go",
  "rust",
  "vue",
}
vim.g.markdown_fenced_languages = fences
-- Rust auto rustfmt on save:
vim.g.rustfmt_autosave = 1
