return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  -- {
  --   "greggh/claude-code.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- Required for git operations
  --   },
  --   opts = {
  --     -- Keymaps
  --     keymaps = {
  --       toggle = {
  --         normal = "<C-,>", -- Normal mode keymap for toggling Claude Code, false to disable
  --         terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
  --         variant = {
  --           continue = "<leader>aC", -- Normal mode keymap for Claude Code with continue flag
  --           verbose = "<leader>aV", -- Normal mode keymap for Claude Code with verbose flag
  --         },
  --       },
  --       window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
  --       scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
  --     },
  --   },
  -- },
}
