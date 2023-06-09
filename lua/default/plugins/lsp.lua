local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    -- 'Enter' key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctr+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  }
})
