require("toggleterm").setup{
    size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
    end,
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    open_mapping = '<leader>tt'
}
