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
vim.keymap.set("n", "<leader>ff", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "mini.files" })
vim.keymap.set("n", "<leader>fF", function()
  require("mini.files").open(vim.uv.cwd(), true)
end, { desc = "mini.files (cwd)" })
vim.keymap.set("n", "<leader>sp", ":Telescope find_files<CR>", { desc = "Search Project" })
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<CR>", { desc = "Project Files" })
vim.keymap.set("n", "<leader>fd", ":call delete(expand('%')) | bdelete!<CR>", { desc = "Delete File" })
vim.keymap.set("n", "<leader><space>", ":", { desc = "Cmdline" })

vim.keymap.set(
  "n",
  "<leader>sp",
  ":lua require('telescope.builtin').live_grep()<cr>",
  { desc = "Find in Project Files" }
)
vim.keymap.set("n", "<leader>fy", ':let @+ = expand("%:p")<CR>', { desc = "Copy Filename" })
wk.add({
  { "<leader>o", group = "Obsidian" },
}) -- group
vim.keymap.set("n", "<leader>oo", ":Obsidian quick_switch<CR>", { desc = "Obsidian" })
vim.keymap.set("n", "<leader>os", ":Obsidian search<CR>", { desc = "Search" })
vim.keymap.set("n", "<leader>od", ":Obsidian today<CR>", { desc = "Today" })
vim.keymap.set("n", "<leader>ot", ":Obsidian tomorrow<CR>", { desc = "Tomorrow" })
vim.keymap.set("n", "<leader>oT", ":Obsidian tags<CR>", { desc = "Tomorrow" })
