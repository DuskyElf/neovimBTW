-- Ensure zls is available
if vim.fn.executable('zls') ~= 1 then
  return
end

local root_files = { 'zls.json', 'build.zig', '.git' }
local root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1])

vim.lsp.start {
  name = 'zls',
  cmd = { 'zls' },
  root_dir = root_dir,
  capabilities = require('user.lsp').make_client_capabilities(),
  filetypes = { 'zig', 'zir' },
  workspace_required = false,
}
