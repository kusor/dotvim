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

-- ~/.config/nvim/lua/config/keymaps.lua

-- Better escape from terminal mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Enter Normal Mode" })
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Enter Normal Mode" })

-- Seamless window navigation from terminal
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to Left Window" })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to Lower Window" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to Upper Window" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to Right Window" })

-- Move between buffers (tabs) directly from Terminal mode
vim.keymap.set("t", "<C-Up>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("t", "<C-Down>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
