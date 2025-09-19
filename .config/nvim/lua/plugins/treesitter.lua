-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  version = "*",
  lazy = false,
  branch = 'main',
  build = ':TSUpdate'
}
