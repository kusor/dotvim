local M = {}

local servers = {
  html = {},
  jsonls = {},
  pyright = {},
  tsserver = {},
  vimls = {},
  graphql = {},
  vuels = {},
  denols = {},
  terraformls = {}
}

local goplsserver = {
    gopls = {},
}

local luaserver = {
  sumneko_lua = {},
}

local rustserver = {
  rust_analyzer = {},
}

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)

  -- Configure highlighting
  require("config.lsp.highlighter").setup(client)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}


local luaopts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
        diagnostics = {
            globals = {'vim'},
        }
    }
  },
}

local rustopts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy"
      },
    }
  }
}

local goplsopts = {
    on_attach = on_attach;
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    cmd = {"gopls", "serve"};
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        experimentalWorkspaceModule = true,
      },
    };
}

function M.setup()
  require("config.lsp.installer").setup(luaserver, luaopts)
  require("config.lsp.installer").setup(rustserver, rustopts)
  require("config.lsp.installer").setup(goplsserver, goplsopts)
  require("config.lsp.installer").setup(servers, opts)
end

return M
