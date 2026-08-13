vim.loader.enable()

local opt = vim.o
local cmd = vim.cmd

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for markdown files with obsidian
vim.opt_local.conceallevel = 2

opt.path = vim.o.path .. '**'

opt.number = true
opt.relativenumber = true
opt.lazyredraw = true
opt.showmatch = true
opt.matchtime = 3
opt.incsearch = true
opt.hlsearch = true

opt.spell = true
opt.spelllang = 'en'

opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.foldenable = true
opt.history = 2000
opt.nrformats = 'bin,hex' -- 'octal'
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Don't know much about
opt.cmdheight = 0
opt.colorcolumn = '100'

-- Configure Neovim diagnostic messages
local function prefix_diagnostic(prefix, diagnostic)
  return string.format(prefix .. ' %s', diagnostic.message)
end

vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '⚠',
      [vim.diagnostic.severity.INFO] = 'ⓘ',
      [vim.diagnostic.severity.HINT] = '󰌶',
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
}

-- Native plugins
cmd.filetype('plugin', 'indent', 'on')
cmd.packadd('cfilter') -- Allows filtering the quickfix list with :cfdo

-- let sqlite.lua (which some plugins depend on) know where to find sqlite
vim.g.sqlite_clib_path = require('luv').os_getenv('LIBSQLITE')
