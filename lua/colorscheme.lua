require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "lotus",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd([[colorscheme cobalt]])
--vim.o.background = "dark"

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'cobalt',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        {
            'filename',
            file_status = true,     
            newfile_status = true, 
            path = 3, -- 2: Absolute path, 3: Absolute path, with tilde as the home directory
            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                               -- for other components. (terrible name, any suggestions?)
            symbols = {
            modified = '[+]',      
            readonly = '[-]',     
            unnamed = '[No Name]',
            newfile = '[New]',
            }
        },
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {'quickfix','lazy'}
}

--[[
local bufferline = require('bufferline')
--bufferline
bufferline.setup{
    options = {
        tab_size = 12,
        mode = "tabs",
        style_preset = bufferline.style_preset.no_italic,
        indicator = {
                icon = '', -- this should be omitted if indicator style is not 'icon'
                style = 'icon'
        }
    }
}
]]--
