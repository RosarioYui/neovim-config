require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pylsp', 'clangd', 'lua_ls'}
})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_attach = function(client, bufnr)
    local ft = vim.bo.filetype
    if ft == "" or ft == nil then
        client.stop()
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

require('lspconfig').clangd.setup({
    on_attach = custom_attach,
    ["clangd"] = {
          cmd = { "clangd", "--offset-encoding=utf-16"},
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          single_file_support = true,
          root_dir =  require('lspconfig').util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
          ) 
    }
})

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

require('lspconfig').verible.setup({
    on_attach = custom_attach,
        cmd = { 'verible-verilog-ls' },
        root_dir = require('lspconfig').util.root_pattern({'.git', 'verilator.f'}),
        filetypes = { "verilog", "systemverilog"},
})

require('lspconfig').pylsp.setup{
    on_attach = custom_attach,
    cmd = { "pylsp" },
    filetypes = { "python" },
    single_file_support = true,
}

require('lspconfig').rust_analyzer.setup({
    on_attach = custom_attach,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false;
            }
        }
    },
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    single_file_support = true,
    capabilities = {
        experimental = {
            serverStatusNotification = true
        }
    },
    checkOnSave = {
          command = "clippy",
    },
    standalone = true,
    inlayHints = {
        closureCaptureHints = {
            enable = true
        }
    }
})


--require'lspconfig'.marksman.setup{
--    on_attach = custom_attach
--}
