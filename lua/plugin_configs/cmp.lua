local cmp = require('cmp')
--local luasnip = require('luasnip')


cmp.setup{
    completion = {keyword_length = 1},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            --luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior=cmp.ConfirmBehavior.Insert })
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'tags'},
        {name = 'buffer'},
        {name = 'path'},
    })
}

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {name = 'buffer'}
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        {name = 'path'},
        {name = 'cmdline'}
    })
})
