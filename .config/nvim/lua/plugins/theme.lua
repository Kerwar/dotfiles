return {
  "ribru17/bamboo.nvim",
  version = "*",
  dependencies = {
    {
      "rose-pine/neovim",
      name = "rose-pine",
    },
    'Mofiqul/vscode.nvim',
    "ellisonleao/gruvbox.nvim",
    "marko-cerovac/material.nvim",
    "nickkadutskyi/jb.nvim",
    'RostislavArts/naysayer.nvim',
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
  },
  priority = 1000, -- Make sure to load this before all the other start plugins.
}
