-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
  },
  -- tag = "0.1.x",
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    require("config.telescope.multigrep").setup()
  end,
  keys = {
    { "<leader>ff", require("telescope.builtin").find_files,  desc = "[F]ind [F]ile" },
    { "<leader>fh", require("telescope.builtin").help_tags,   desc = "[F]ind [H]elp" },
    { "<leader>ft", require("telescope.builtin").builtin,     desc = "[F]ind [T]elescope" },
    { "<leader>fg", require("telescope.builtin").live_grep,   desc = "[F]ind by [G]rep" },
    { "<leader>fw", require("telescope.builtin").grep_string, desc = "[F]ind [W]ord under cursor" },
    { "<leader>fr", require("telescope.builtin").live_grep,   desc = "[F]ind [R]esume" },
    {
      "<leader>en",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[E]dit a [N]eovim configuration file",
    },
    {
      "<leader>ep",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end,
      desc = "[E]dit a Neovim [p]lugin data file",
    },
  },
}
