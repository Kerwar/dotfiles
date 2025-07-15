return {
  "ribru17/bamboo.nvim",
  dependencies = {
    'uloco/bluloco.nvim',
    {
      "rose-pine/neovim",
      name = "rose-pine",
    },
    'rktjmp/lush.nvim',
    'Mofiqul/vscode.nvim',
    "ellisonleao/gruvbox.nvim",
    "marko-cerovac/material.nvim",
    "nickkadutskyi/jb.nvim",
    'RostislavArts/naysayer.nvim',
  },
  priority = 1000, -- Make sure to load this before all the other start plugins.
}
