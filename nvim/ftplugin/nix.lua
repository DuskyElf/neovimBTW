vim.lsp.config('nil_ls', {
  root_markers = {
    'flake.nix',
    'default.nix',
    'shell.nix',
    '.git',
  };
  capabilities = require('user.lsp').make_client_capabilities(),
})

vim.lsp.enable('nil_ls')
