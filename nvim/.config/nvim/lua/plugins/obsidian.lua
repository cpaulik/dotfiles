return {
  {
    "obsidian-nvim/obsidian.nvim",
    -- version = "3.12", -- recommended, use latest release instead of latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/Users/cpaulik/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },

      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "Inbox",

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,
        blink = true,
        create_new = true,
      },

      callbacks = {
        enter_note = function(_, note)
          vim.keymap.set("n", "<localleader>ob", "<cmd>Obsidian backlinks<cr>", {
            buffer = note.bufnr,
            desc = "Backlinks",
          })
          vim.keymap.set("n", "<localleader>ol", "<cmd>Obsidian link_new<cr>", {
            buffer = note.bufnr,
            desc = "New link",
          })
          vim.keymap.set("n", "<localleader>or", "<cmd>Obsidian rename<cr>", {
            buffer = note.bufnr,
            desc = "Rename",
          })
        end,
      },
      -- Either 'wiki' or 'markdown'.
      preferred_link_style = "markdown",

      ui = {
        enable = false, -- disabled since using render-markdown.nvim
      },
    },
  },
}
