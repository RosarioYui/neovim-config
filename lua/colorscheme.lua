vim.cmd([[colorscheme onenord]])
vim.o.background = "dark"

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
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

