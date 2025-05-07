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
    { "<leader>ff", function() require("telescope.builtin").find_files() end,  desc = "[F]ind [F]ile" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,   desc = "[F]ind [H]elp" },
    { "<leader>ft", function() require("telescope.builtin").builtin() end,     desc = "[F]ind [T]elescope" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,   desc = "[F]ind by [G]rep" },
    { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "[F]ind [W]ord under cursor" },
    { "<leader>fr", function() require("telescope.builtin").resume() end,      desc = "[F]ind [R]esume" },
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
