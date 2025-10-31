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
        event = { "BufReadPre", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "quangnguyen30192/cmp-nvim-tags" },
            { "saadparwaiz1/cmp_luasnip" },
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp"
            }
        },
        config = function()
            require("plugin_configs.cmp")
        end,
        lazy = false
    },
    {
        "github/copilot.vim", enable = false
    },
    {
        'stevearc/aerial.nvim',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        lazy = false
    },

    -- rust
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig", lazy = false }
        },
        lazy = false
    },

    -- clangd
    {
        "p00f/clangd_extensions.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig", lazy = false }
        },
        lazy = false
    },

    -- colorsheme
    -- {"AlexvZyl/nordic.nvim",lazy=true},
    -- {"rafamadriz/neon",lazy=true},
    {
        "rmehri01/onenord.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = true,
        "rmehri01/onenord.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugin_configs.treesitter")
        end,
    },
    { "rafamadriz/neon" },
    {
        "norcalli/nvim-colorizer.lua",
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
        lazy = false,                      -- neo-tree will lazily load itself
        config = function()
            require("plugin_configs.neo-tree")
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("plugin_configs.toggleterm")
        end
    },
    {
        "wurli/cobalt.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,

    },
    {
        "vague-theme/vague.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                -- optional configuration here
            })
            vim.cmd("colorscheme vague")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugin_configs.telescope")
        end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugin_configs.harpoon")
        end
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        md = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true
    }, -- lazy
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        transparent = false
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("plugin_configs.bufferline")
        end
    },
    { "onsails/lspkind.nvim" },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}
