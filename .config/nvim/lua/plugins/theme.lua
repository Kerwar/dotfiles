return {
  "ribru17/bamboo.nvim",
  version = "*",
  dependencies = {
    {
      "rose-pine/neovim",
      name = "rose-pine",
      version = "*",
    },
    { 'Mofiqul/vscode.nvim', version = '*' },
    { "ellisonleao/gruvbox.nvim", version = '*' },
    { "marko-cerovac/material.nvim", version = '*' },
    { "nickkadutskyi/jb.nvim", version = '*' },
    { 'RostislavArts/naysayer.nvim', version = '*' },
    { "navarasu/onedark.nvim", version = '*' },
    { "folke/tokyonight.nvim", version = '*' },
  },
  priority = 1000, -- Make sure to load this before all the other start plugins.
}
