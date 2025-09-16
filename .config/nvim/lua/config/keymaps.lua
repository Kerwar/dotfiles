-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dh",
  function()
    vim.diagnostic.setqflist { severity = { min = vim.diagnostic.severity.HINT } }
  end,
  { desc = "Open [D]iagnostic [H]ints Quickfix list" })
vim.keymap.set("n", "<leader>di", function()
    vim.diagnostic.setqflist { severity = { min = vim.diagnostic.severity.INFO } }
  end,
  { desc = "Open [D]iagnostic [I]nfo Quickfix list" })
vim.keymap.set("n", "<leader>dw", function()
    vim.diagnostic.setqflist { severity = { min = vim.diagnostic.severity.WARN } }
  end,
  { desc = "Open [D]iagnostic [W]arning Quickfix list" })
vim.keymap.set("n", "<leader>de", function()
    vim.diagnostic.setqflist { title = 'Errors', severity = vim.diagnostic.severity.ERROR }
  end,
  { desc = "Open [D]iagnostic [Q]uickfix list" })
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

-- Quickfix list
vim.keymap.set("n", "<leader>q", "<Cmd>cwindow<CR>", { desc = "[Q]uickfix toggle" })
vim.keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", { desc = "[Q]uickfix list [O]pen" })
vim.keymap.set("n", "<leader>qc", "<Cmd>cclose<CR>", { desc = "[Q]uickfix list [C]lose" })
vim.keymap.set("n", "<leader>qn", "<Cmd>cnext<CR>", { desc = "[Q]uickfix list [N]ext" })
vim.keymap.set("n", "<leader>qp", "<Cmd>cprev<CR>", { desc = "[Q]uickfix list [P]revious" })
