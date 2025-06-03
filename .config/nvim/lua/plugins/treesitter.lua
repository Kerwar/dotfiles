-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  lazy = false,
  opts = {
    install = {
      "bash",
      "c",
      "cpp",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
