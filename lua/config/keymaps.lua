-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- restore the session for the current directory
vim.api.nvim_set_keymap(
  "n",
  "<leader>ss",
  [[<cmd>lua require'persistence'.load()<cr>]],
  { nowait = true, silent = true, noremap = true }
)

-- restore the last session
vim.api.nvim_set_keymap(
  "n",
  "<leader>sl",
  [[<cmd>lua require'persistence'.load({ last = true })<cr>]],
  { nowait = true, silent = true, noremap = true }
)

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap(
  "n",
  "<leader>sq",
  [[<cmd>lua require'persistence'.stop()<cr>]],
  { nowait = true, silent = true, noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":NvimTreeClose<CR>", { noremap = true, silent = true })

-- NvimTree Toggle
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
