local function get_workspace()
  local f = io.open(os.getenv("HOME") .. "/.machine-profile", "r")
  local profile = f and f:read("*l") or "home"
  if f then
    f:close()
  end

  if profile == "work" then
    return { name = "work", path = os.getenv("HOME") .. "/Documents/todos" }
  else
    return {
      name = "personal",
      path = os.getenv("HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
    }
  end
end

return {
  {
    "obsidian-nvim/obsidian.nvim",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = { get_workspace() },
      legacy_commands = false,
      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "Inbox",

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Diary",
      },
      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,
        blink = true,
        create_new = true,
      },
      footer = {
        enabled = false,
      },

      callbacks = {
        enter_note = function(note)
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
      link = {
        style = "markdown",
      },

      ui = {
        enable = false, -- disabled since using render-markdown.nvim
      },
    },
  },
}
