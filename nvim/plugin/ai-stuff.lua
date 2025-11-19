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

require('avante').setup({
    provider = 'copilot',

    providers = {
        copilot = {
            model = 'gpt-4.1',
        }
    }
})
