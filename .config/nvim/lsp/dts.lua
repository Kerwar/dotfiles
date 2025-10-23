-- Install with: cargo install dts-lsp

---@type vim.lsp.Config
return {
  cmd = { "dts-lsp" },
  filetypes = { 'dts' },
}
