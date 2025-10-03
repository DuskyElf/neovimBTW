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
            accept = "<C-l>",
            accept_word = "<Tab>",
            accept_line = "<C-b>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        }
    },
})
