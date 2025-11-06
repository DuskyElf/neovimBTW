local servers = { 'ts_ls', 'tailwindcss', 'eslint', "astro" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
      capabilities = require('user.lsp').make_client_capabilities(),
  })
  vim.lsp.enable(server)
end

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.completion.spell,
  },
})
