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
            ["<C-l>"] = actions.select_vertical,
            ["<C-f>"] = actions.to_fuzzy_refine,
            ["<esc>"] = actions.close,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "-g",
          "!.git",
        },
        layout_strategy = "vertical",
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
      },
    }
  end,
}
