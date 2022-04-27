local utils = require('utils')
utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '&', '^') -- ^ not very handy in spanish kbd
vim.api.nvim_set_keymap('n', '<leader>z', ':Centerpad<CR>', { silent = true, noremap = true })
-- Custom centerpad size (default is leftpad = 20
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 20 }<cr>", { silent = true, noremap = true })
-- Terminal escape key
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { nowait = true, silent = true, noremap = true })
-- Playing with local plugins
-- vim.api.nvim_set_keymap("n", "<Leader>t", "<Plug>PlenaryTestFile", {})
--
-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], { nowait = true, silent = true, noremap = true })

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], { nowait = true, silent = true, noremap = true })

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], { nowait = true, silent = true, noremap = true })
