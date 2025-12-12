vim.lsp.config('rust_analyzer', {
    capabilities = require('user.lsp').make_client_capabilities(),
})
vim.lsp.enable("rust_analyzer")


vim.lsp.config('gopls', {
    capabilities = require('user.lsp').make_client_capabilities(),
})
vim.lsp.enable('gopls')
