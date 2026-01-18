local servers = {'ruff', 'ty', 'typos'}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
      capabilities = require('user.lsp').make_client_capabilities(),
  })
  vim.lsp.enable(server)
end
