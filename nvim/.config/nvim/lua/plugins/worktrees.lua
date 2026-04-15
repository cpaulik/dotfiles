return {
  {
    "Juksuu/worktrees.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>gws", function() Snacks.picker.worktrees() end, desc = "Switch Worktree" },
      { "<leader>gwn", function() Snacks.picker.worktrees_new() end, desc = "New Worktree" },
      { "<leader>gwr", function() Snacks.picker.worktrees_remove() end, desc = "Remove Worktree" },
    },
  },
}
