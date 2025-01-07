return {
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
        "github/copilot.vim"
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
    }
}
