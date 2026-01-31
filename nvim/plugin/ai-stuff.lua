if vim.g.did_load_ai_stuff then
    return
end
vim.g.did_load_ai_stuff = true

-- copilot
require('copilot').setup({
    panel = {
        enabled = false,
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            accept = "<C-b>",
            accept_word = "<Tab>",
            accept_line = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        }
    },
})

-- opencode

-- required dependency
require("snacks").setup({
    input = {
        enable = true,
    },
    picker = {
        enable = true,
    }
})

vim.g.opencode_opts = {
    port = 5096,
    provider = {
        cmd = "opencode --agent neovim",
        enabled = "tmux",
    },
}

vim.o.autoread = true

local opencode = require("opencode")

vim.keymap.set({ "n", "x" }, "<leader>.d", function() opencode.ask(" @this: ", { submit = true }) end,
    { desc = "Ask opencode and submit" })
vim.keymap.set({ "n", "x" }, "<leader>.a", function() opencode.ask(" @this: ", {}) end,
    { desc = "append Ask opencode" })
vim.keymap.set("n", "<leader>.n", function() opencode.command('session.new') end, { desc = "Create new session" })
vim.keymap.set({ "n", "x" }, "<leader>.s", function() opencode.select() end, { desc = "Execute opencode action…" })
