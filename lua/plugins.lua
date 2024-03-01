return {
    {
        "nvim-tree/nvim-web-devicons", 
        lazy=true
    },
    {
        "neovim/nvim-lspconfig", 
        lazy=true, 
        dependencies = {
            {"williamboman/mason.nvim", lazy=true},
            {"williamboman/mason-lspconfig.nvim", lazy=true}
        }, 
        config = function()
            require("plugin_configs.lsp")
        end
    },
    -- auto complete
    -- event = {"BufReadPre", "CmdlineEnter", 
    {
        "hrsh7th/nvim-cmp", 
        event = "InsertEnter", 
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},
            {"quangnguyen30192/cmp-nvim-tags"},
            {"saadparwaiz1/cmp_luasnip"},
        },
    },
    {
        "github/copilot.vim",
        lazy=true
    },
    {
        'stevearc/aerial.nvim',
        dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
        }, lazy=true
    },

    -- rust
    {
        "simrat39/rust-tools.nvim", 
        dependencies = {
        {"neovim/nvim-lspconfig", lazy=true}    
        }, lazy=true
    },

    -- clangd
    {
        "p00f/clangd_extensions.nvim", 
        dependencies = {
        {"neovim/nvim-lspconfig", lazy=true}    
        }, lazy=true
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
    } 
}
