local M = {}

function M.setup()
  local npairs = require "nvim-autopairs"
  npairs.setup {
    check_ts = true,
    map_cr = true,
    map_complete = true,
    auto_select = false,
    ts_config = {
	lua = { 'string' },
	javascript = { 'template_string' }
    }
  }
  npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
end

return M

