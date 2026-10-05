return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false, -- Asegura que ToggleTerm esté listo de inmediato
    keys = {
      -- <leader>ai abrirá la TUI interactiva de Antigravity en una ventana flotante limpia
      { "<leader>ai", desc = "Toggle Antigravity CLI" },
    },
    config = function()
      -- Importamos ToggleTerm de forma segura
      local toggleterm = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal

      toggleterm.setup({
        size = 20,
        open_mapping = [[<c-\>]], -- Mapeo por defecto de ToggleTerm
        direction = "float",
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })

      -- Creamos la instancia dedicada para el binario 'agy' de Antigravity
      local antigravity_agent = Terminal:new({
        cmd = "agy", -- Llama directamente al ejecutable oficial de Google
        hidden = true,
        direction = "float",
        -- Se asegura de que al cerrar la ventana flotante no mates el agente en segundo plano
        close_on_exit = false, 
      })

      -- Función para abrir y cerrar el panel de Antigravity de manera persistente
      local function toggle_antigravity()
        antigravity_agent:toggle()
      end

      -- Asignamos el atajo usando la API nativa de Neovim para evitar problemas de sincronización de Lazy
      vim.keymap.set("n", "<leader>ai", toggle_antigravity, { desc = "Toggle Antigravity CLI", silent = true })
    end,
  },
}
