local M = {}

function M.setup()
  local snippets = require "garymjr/nvim-snippets"

  snippets.setup {
    keys = {
    {
      "<Tab>",
      function()
        if vim.snippet.jumpable(1) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
          return
        end
        return "<Tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<Tab>",
      function()
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      end,
      expr = true,
      silent = true,
      mode = "s",
    },
    {
      "<S-Tab>",
      function()
        if vim.snippet.jumpable(-1) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
          return
        end
        return "<S-Tab>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  },
  create_autocmd = true,
  create_cmp_source = true,
  friendly_snippets = true
  }

end

return M
