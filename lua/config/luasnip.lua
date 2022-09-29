local M = {}

function M.setup()
  local luasnip = require "luasnip"

  luasnip.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
  }

  require("luasnip/loaders/from_vscode").load()
  require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
end

return M

