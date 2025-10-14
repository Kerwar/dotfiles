vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cc' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_user_command('ToggleInlayHints', function()
    vim.g.inlay_hints = not vim.g.inlay_hints
    vim.notify(string.format('%s inlay hints...', vim.g.inlay_hints and 'Enabling' or 'Disabling'), vim.log.levels.INFO)

    local mode = vim.api.nvim_get_mode().mode
    vim.lsp.inlay_hint.enable(vim.g.inlay_hints and (mode == 'n' or mode == 'v'))
end, { desc = 'Toggle inlay hints', nargs = 0 })
