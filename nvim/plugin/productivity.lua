require("obsidian").setup {
  legacy_commands = false,

  workspaces = {
    {
      name = "brain",
      path = "~/Documents/brain/",
    }
  },

  notes_subdir = "notes",
  new_notes_location = "notes_subdir",

  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },

  daily_notes = {
    folder = "daily",
    date_format = "%Y-%m-%d-%a",
    alias_format = "%A, %B %d, %Y",
    default_tags = { "daily-notes" },
    template = "daily.md",
    workdays_only = false,
  },

  callbacks = {
    post_setup = function()
      vim.keymap.set("n", "<leader>note", "<cmd>Obsidian new_from_template<CR>", { desc = "New note from template" })
      vim.keymap.set("n", "<leader>dn", "<cmd>Obsidian today<CR>", { desc = "Open today's daily note" })
      vim.keymap.set("n", "<leader>ngr", "<cmd>Obsidian search<CR>", { desc = "Grep in notes" })
      vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian quick_switch<CR>", { desc = "Switch to note" })
      vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian backlinks<CR>", { desc = "See backlinks to the current note" })
    end,
  },

  ui = {
    enable = false,
  },
}
