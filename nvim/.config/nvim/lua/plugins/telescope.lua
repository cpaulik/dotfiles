return {
  "nvim-telescope/telescope.nvim",
  -- opts will be merged with the parent spec
  opts = function()
    local actions = require("telescope.actions")
    return {
      extensions = {
        project = {
          hidden_files = true, -- default: false
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.preview_scrolling_down,
            ["<C-p>"] = actions.preview_scrolling_up,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
          },
        },
      },
    }
  end,
}
