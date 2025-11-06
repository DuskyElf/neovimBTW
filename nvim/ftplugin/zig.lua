vim.lsp.config ('zls', {
  capabilities = require('user.lsp').make_client_capabilities(),
})

vim.lsp.enable('zls')
