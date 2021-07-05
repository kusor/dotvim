-- https://github.com/neovim/nvim-lspconfig#rust_analyzer
-- nvim_lsp object
local nvim_lsp = require'lspconfig'
local lsp_status = require'lsp-status'
-- function to attach completion
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    lsp_status.on_attach(client)
    require('folding').on_attach()
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities
})

-- GOPLS
nvim_lsp.gopls.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities,
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        experimentalWorkspaceModule = true,
      },
    },
})
nvim_lsp.html.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities
})
nvim_lsp.tsserver.setup({
    on_attach=on_attach;
    root_dir=nvim_lsp.util.root_pattern("package.json", "tsconfig.json", ".git", ".eslintrc");
    capabilities=lsp_status.capabilities;
})
nvim_lsp.terraformls.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities
})

nvim_lsp.graphql.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities,
    default_config = {
      cmd = {'graphql-lsp', 'server', '-m', 'stream'},
      filetypes = {'graphql'},
      root_dir = nvim_lsp.util.root_pattern('.git', '.graphqlrc'),
    }
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#vuels
nvim_lsp.vls.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities,
})

