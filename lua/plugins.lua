local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Color scheme
    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}
    use {'NLKNguyen/papercolor-theme'}


    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        },
        config = function() require('lualine').setup {
            options = { theme = 'gruvbox' },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            sections = {
                lualine_c = { 'filename', { path = 1} }
            },
            extensions = {'nvim-tree'}
        } end
    }

    -- Git
    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }
    -- Proper surround
    use {'tpope/vim-surround'}

    -- Dir tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup {
                -- no custom stuff yet, but setup needs to be called
            }
        end
    }

    -- TreeSitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-textobjects', wants = "nvim-treesitter"}
    use {'nvim-treesitter/playground', wants = "nvim-treesitter"}

    use {
        'windwp/nvim-autopairs',
        wants = "nvim-treesitter",
        module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
        config = function()
            require("config.autopairs").setup()
        end,
    }

    -- Per filetype tab settings
    use {
        'FotiadisM/tabset.nvim',
        config = function()
            require("config.tabset").setup()
        end
    }

    -- Auto tag
    use {
        "windwp/nvim-ts-autotag",
        wants = "nvim-treesitter",
        config = function()
            require("nvim-ts-autotag").setup { enable = true }
        end,
    }

    -- End wise
    use {
        "RRethy/nvim-treesitter-endwise",
        wants = "nvim-treesitter"
    }

    -- WhichKey
    use {
        "folke/which-key.nvim",
        config = function()
            require("config.whichkey").setup()
        end,
    }

    -- Colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }

    -- Ack for the win!
    use {'mileszs/ack.vim'}

    -- Fuzzy finder, Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    -- LSP and completion
    use {
        'neovim/nvim-lspconfig',
        wants = {"cmp-nvim-lsp", "nvim-lsp-installer", "lsp_signature.nvim"},
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "ray-x/lsp_signature.nvim",
        },
    }
    use { 'nvim-lua/completion-nvim' }
    -- It used to be nvim-compe, now it's this:
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp").setup()
        end,
        wants = { "LuaSnip" },
        requires = {
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
            wants = "friendly-snippets",
            config = function()
                require("config.luasnip").setup()
            end,
            },
            "rafamadriz/friendly-snippets",
            disable = false,
        },
    }

    -- Rust tools
    use {
        "simrat39/rust-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
        module = "rust-tools",
        ft = { "rust" },
        config = function()
            require("rust-tools").setup {}
        end,
    }


    -- DAP
    use { 'mfussenegger/nvim-dap' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    require('telescope').load_extension('dap')
    -- require('dbg.python')
    -- use { 'mfussenegger/nvim-dap-python' } -- Python
    use {'theHamsta/nvim-dap-virtual-text'}
    use {'rcarriga/nvim-dap-ui'}
    use {'Pocco81/DAPInstall.nvim'}


    -- Centerpad focus mode for current buffer, keeps the status line
    -- and works when you switch tabs
    use { 'smithbm2316/centerpad.nvim' }

    -- Zen Mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
            }
        end
    }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
            }
        end
    }

    use({
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup()
        end,
    })

    -- playing with local plugins
    --  use {
    --      '~/study/neovim-plugins/uppercase.nvim',
    --      module = "uppercase",
    --      config = function()
    --          require("uppercase").setup()
    --      end
    --  }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
