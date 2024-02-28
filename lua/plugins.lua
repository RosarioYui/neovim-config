return {
    {"nvim-tree/nvim-web-devicons", lazy=true},
    {"neovim/nvim-lspconfig", lazy=true, dependencies = {
        {"williamboman/mason.nvim", lazy=true},
        {"williamboman/mason-lspconfig.nvim", lazy=true}
    }, config = function()
        require("plugin_configs.lsp")
    end
    },
    -- auto complete
    {"hrsh7th/nvim-cmp", event = {"BufReadPre", "CmdlineEnter"}, dependencies = {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"},
        {"quangnguyen30192/cmp-nvim-tags"},
        {"saadparwaiz1/cmp_luasnip"},
    }, config = function()
        require("plugin_configs.cmp")
    end},
    {"github/copilot.vim"},

    -- rust
    {"simrat39/rust-tools.nvim", dependencies = {
        {"neovim/nvim-lspconfig", lazy=true}    
    }},
    -- clangd
    {"p00f/clangd_extensions.nvim", dependencies = {
        {"neovim/nvim-lspconfig", lazy=true}    
    }},
    -- colorsheme
    {"AlexvZyl/nordic.nvim",lazy=true},
    {"rafamadriz/neon",lazy=true},
    {"rmehri01/onenord.nvim",lazy=true},
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}
