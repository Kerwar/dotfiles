-- Install with
-- Arch: git clone https://github.com/zigtools/zls
-- cp zls/zls ~/.local/bin

---@type vim.lsp.Config
return {
    cmd = {
        'zls',
    },
    filetypes = { 'zig' },
}
