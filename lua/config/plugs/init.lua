return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/plenary.nvim",
  "sainnhe/gruvbox-material",
  "NLKNguyen/papercolor-theme",
  "tpope/vim-fugitive",
  "mileszs/ack.vim",
  "nvim-lua/completion-nvim",
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup {
        override = require("nvim-material-icon").get_icons(),
      }
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
      }
    end,
  },
--[[
  "mfussenegger/nvim-dap",
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end
  },
  "theHamsta/nvim-dap-virtual-text",
  "rcarriga/nvim-dap-ui",
  "Pocco81/DAPInstall.nvim",
]]--
  "smithbm2316/centerpad.nvim",
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
      }
    end
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
      }
    end
  },
  "gpanders/editorconfig.nvim",
  "ziglang/zig.vim",
  {
    "folke/which-key.nvim",
    config = function()
        require("config.whichkey").setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end
  },
  { "mrshmllow/document-color.nvim",
    config = function()
      require("document-color").setup {
        -- Default options
        mode = "background", -- "background" | "foreground" | "single"
      }
    end
  },
  -- Rust tools
--[[
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim", "neovim/nvim-lspconfig" },
    config = function()
      require("rust-tools").setup {}
    end,
  },
]]--
  -- Golang (vim-go did not play nice with LSP ...)
  {
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
          goimport='gopls',
          gofmt = 'gopls',
          max_line_len = 1200,
          tag_transform = false,
          test_template = '',
          test_template_dir = '',
          comment_placeholder = '' ,
          verbose = false,
          lsp_cfg = false,
          lsp_gofumpt = false,
          lsp_on_attach = true,
          gopls_cmd = nil,
          dap_debug = false,
          dap_debug_keymap = true,
          dap_debug_gui = true,
          dap_debug_vt = true,
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons", lazy = true
    },
    config = function()
      require("lualine").setup {
        options = { theme = "gruvbox" },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        sections = {
            lualine_c = { "filename", { path = 1} }
        },
        extensions = {"nvim-tree"}
      }
    end
  },
  {
    "FotiadisM/tabset.nvim",
    config = function()
      require("config.tabset").setup()
    end
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      -- background_colour = "#A3CCBE",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require "notify"
    end,
  },
  { "tpope/vim-surround", event = "BufReadPre", enabled = false },
  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    opts = {},
  },
  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  -- TreeSitter
--[[
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs").setup()
    end
  },
  -- Auto tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup { enable = true }
    end,
  },
  -- End wise
  "RRethy/nvim-treesitter-endwise",
  -- Fuzzy finder, Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make'
  },
  -- LSP and completion
  {
    "neovim/nvim-lspconfig",
    wants = {},
    config = function()
      --TODO: require("config.lsp").setup()
    end,
    dependencies = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
      "cmp-nvim-lsp",
      "nvim-lsp-installer",
      "lsp_signature.nvim"
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp").setup()
    end,
    dependencies = {
      "LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-emoji",
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "friendly-snippets" },
        config = function()
          require("config.luasnip").setup()
        end,
      },
      "rafamadriz/friendly-snippets",
      enabled = true,
    },
  },
]]--
}
