-- Highlight todo, notes, etc in comments
return {
  "folke/todo-comments.nvim",
  version = "*",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = true },
}
