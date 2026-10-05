return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gblame", "Gwrite", "Glog" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame (Fugitive)" },
  },
}
