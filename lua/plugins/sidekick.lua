return {
  {
    "folke/sidekick.nvim",
    cmd = "Sidekick",
    keys = {
      { "<leader>as", "<cmd>Sidekick toggle<cr>", desc = "Toggle Sidekick (agy)" },
    },
    opts = {
      cli = {
        tools = {
          antigravity = {
            cmd = { "agy" }, -- Invoca directamente el CLI de Antigravity
          },
        },
      },
    },
  }
}
