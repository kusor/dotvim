local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        -- Also close on Esc in insert mode
        ["<esc>"] = actions.close,
        ["<C-[>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
}

-- From https://github.com/mrnugget/vimconfig/blob/master/lua/plugins/telescope.lua
local map_options = { noremap = true, silent = true, }

local map_builtin = function(key, f)
  local rhs = string.format("<cmd>lua require('telescope.builtin')['%s']()<CR>", f)
  vim.api.nvim_set_keymap("n", key, rhs, map_options)
end

local helpers = {}

helpers.project_finder = function()
  require("telescope.builtin").find_files({
      prompt_title = "< ~/work >",
      cwd = "~/work",
    })
end

map_builtin('<leader>fp', 'project_finder')

return helpers
