-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.keymap.set(
  "n",
  "<leader>pl",
  ":lua require'telescope'.extensions.project.project{}<CR>",
  { desc = "List Projects" }
)
local wk = require("which-key")
wk.add({
  { "<leader>p", group = "projects" },
}) -- group
vim.keymap.set(
  "n",
  "<leader>ff",
  ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>",
  { desc = "Find Files" }
)
vim.keymap.set(
  "n",
  "<leader>sp",
  ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>",
  { desc = "Search Project" }
)
