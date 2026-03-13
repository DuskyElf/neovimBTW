-- the plugin will automatically lazy load
vim.g.fff = {
    lazy_sync = true, -- start syncing only when the picker is open
    debug = {
        enabled = true,
        show_scores = true,
    },
}

vim.keymap.set('n', '<leader>o', function() require('fff').find_files() end, { desc = 'FFFind files' })

vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = 'LiFFFe grep' })

vim.keymap.set('n', '<leader>fz', function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
    { desc = 'Live fffuzy grep' })

vim.keymap.set('n', '<leader>fc', function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,
    { desc = 'Search current word' })
