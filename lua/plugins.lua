return {
    {
    "sphamba/smear-cursor.nvim",
    opts = {},
    },
    {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    lazy = true
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "williamboman/mason.nvim",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason").setup()
        end,
        lazy = false
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig", 
        config = function()
            require("plugin_configs.lsp")
        end,
        lazy = false
    },
    -- auto complete
    {
        "hrsh7th/nvim-cmp", 
        event = {"BufReadPre", "CmdlineEnter"}, 
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},
            {"quangnguyen30192/cmp-nvim-tags"},
            {"saadparwaiz1/cmp_luasnip"},
            {
            	"L3MON4D3/LuaSnip",
	            build = "make install_jsregexp"
            }
            }, config = function()
            require("plugin_configs.cmp")
        end,
        lazy = false
    },
    {
        "github/copilot.vim", enable=false
    },
    {
        'stevearc/aerial.nvim',
        dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
        }, lazy=false
    },

    -- rust
    {
        "simrat39/rust-tools.nvim", 
        dependencies = {
        {"neovim/nvim-lspconfig", lazy=false}    
        }, lazy=false
    },

    -- clangd
    {
        "p00f/clangd_extensions.nvim", 
        dependencies = {
        {"neovim/nvim-lspconfig", lazy=false}    
        }, lazy=false
    },

    -- colorsheme
    -- {"AlexvZyl/nordic.nvim",lazy=true},
    -- {"rafamadriz/neon",lazy=true},
    {
        "rmehri01/onenord.nvim",
        lazy=false,
        priority=1000, 
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons'},lazy=true,
        "rmehri01/onenord.nvim",
        lazy=false,
        priority=1000,
    },
    {
        'akinsho/bufferline.nvim',
        lazy=true
    }, 
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        config = function()
            require("plugin_configs.treesitter")
        end,
    },
    {"rafamadriz/neon"},
    {"norcalli/nvim-colorizer.lua",
        config = function()
            require("plugin_configs.colorizer")
        end
    },
    {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    lazy = true
    },
    {
    'numToStr/Comment.nvim',
    },
    {
    'mfussenegger/nvim-dap'
    },

    -- lazy.nvim 示例
    {
      "nvimdev/lspsaga.nvim",
      event = "LspAttach",
      config = function()
        require("lspsaga").setup({
          diagnostic = {
            max_width = 100,
            show_code_action = true,
            show_source = true,
          },
          hover = {
            max_width = 100,
          },
          ui = {
            border = "rounded",
          },
        })
      end,
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      }
    },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  }
}
