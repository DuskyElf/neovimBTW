if vim.g.did_load_completion_plugin then
  return
end
vim.g.did_load_completion_plugin = true

local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
    -- autocomplete = true by default, so you get popup automatically
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = function()
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        cmp.complete()
      end
    end,
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.scroll_docs(4),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show both symbol and text
      maxwidth = 50,        -- limit popup width
      ellipsis_char = '...',-- when truncated, show ellipsis
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'buffer' },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  sources = {
    { name = 'nvim_lsp_document_symbol', keyword_length = 3 },
    { name = 'buffer' },
    { name = 'cmdline_history' },
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.confirm({ select = true }),
  },
  view = {
    entries = { name = 'wildmenu', separator = '|' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources {
    { name = 'cmdline' },
    { name = 'cmdline_history' },
    { name = 'path' },
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.confirm({ select = true }),
  },
})
