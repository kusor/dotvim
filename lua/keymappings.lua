local utils = require('utils')
utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '&', '^') -- ^ not very handy in spanish kbd
-- not super easy to use [ ] in Spanish kbd for navigation
utils.map('n', '´', '[')
utils.map('n', 'ç', ']')
vim.api.nvim_set_keymap('n', '<leader>z', ':Centerpad<CR>', { silent = true, noremap = true })
-- Custom centerpad size (default is leftpad = 20
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 20 }<cr>", { silent = true, noremap = true })
-- Terminal escape key
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { nowait = true, silent = true, noremap = true })

