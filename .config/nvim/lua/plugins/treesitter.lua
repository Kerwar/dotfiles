-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  version = "*",
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    highlight = { enable = true },
    ensure_installed = {
      "cpp",
      "zig",
      "c",
      "lua",
      "bash",
      "json",
      "cmake",
      "query",
      "vim",
      "vimdoc",
    },
  }
}
