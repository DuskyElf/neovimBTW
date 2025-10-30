if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup {
  pickers = {
    find_files = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    },
    buffers = {
      theme = "ivy"
    },
    spell_suggest = {
      theme = "ivy"
    }
  }
}

local layout_config = {
  vertical = {
    width = function(_, max_columns)
      return math.floor(max_columns * 0.99)
    end,
    height = function(_, _, max_lines)
      return math.floor(max_lines * 0.99)
    end,
    prompt_position = 'bottom',
    preview_cutoff = 0,
  },
}

-- Fall back to find_files if not in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

--- Like live_grep, but fuzzy (and slower)
local function fuzzy_grep(opts)
  opts = vim.tbl_extend('error', opts or {}, { search = '', prompt_title = 'Fuzzy grep' })
  builtin.grep_string(opts)
end

vim.keymap.set('n', '<C-p>', builtin.oldfiles, { desc = '[telescope] old files' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = '[telescope] live grep' })
vim.keymap.set('n', '<leader>:', builtin.builtin, { desc = 'telescope [:] builtins' })
vim.keymap.set('n', '<leader>o', project_files, { desc = 'telescope [o]pen file' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'telescope [b]uffers' })
vim.keymap.set('n', '<leader>fg', fuzzy_grep, { desc = 'telescope [f]uzzy [g]rep' })
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, { desc = 'telescope [f]ix [s]pell' })
vim.keymap.set('n', '<leader>*', builtin.grep_string, { desc = '[telescope] grep current string [*]' })
vim.keymap.set('n', '<leader>qf', builtin.quickfix, { desc = 'telescope [q]uick[f]ix list' })
vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = 'telescope [c]ommand [h]istory' })
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, { desc = 'telescope lsp document [s]ymbols' })

telescope.setup {
  defaults = {
    path_display = {
      'truncate',
    },
    layout_strategy = 'vertical',
    layout_config = layout_config,
    mappings = {
      i = {
        ['<C-q>'] = actions.send_to_qflist,
        ['<C-l>'] = actions.send_to_loclist,
        ['<esc>'] = actions.close,
        ['<C-s>'] = actions.cycle_previewers_next,
        ['<C-a>'] = actions.cycle_previewers_prev,
      },
      n = {
        q = actions.close,
      },
    },
    preview = {
      treesitter = true,
    },
    history = {
      path = vim.fn.stdpath('data') .. '/telescope_history.sqlite3',
      limit = 1000,
    },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    vimgrep_arguments = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension('fzy_native')
-- telescope.load_extension('smart_history')
