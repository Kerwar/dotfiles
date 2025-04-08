-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "[D]isplay [D]iagnostic" })

vim.keymap.set("n", "<leader>ne", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "[N]ext [E]error" })
vim.keymap.set("n", "<leader>pe", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "[P]revious [E]error" })

-- Exit terminal mode in the builtin terminal with an easier shortcut
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>:q<CR>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>:q<CR>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
