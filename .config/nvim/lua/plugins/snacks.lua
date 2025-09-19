---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  version = "*",
  lazy = false,
  priority = 1000,
  opts = {
    picker = {
      enable = true,
      win = {
        -- input window
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
    -- find
    { "<leader>/b",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/c",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>/f",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>/g",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>/p",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>/r",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>/w",      function() Snacks.picker.grep_word() end,                               desc = "Word or visual",        mode = { "n", "x" } },

    { "grr",             function() Snacks.picker.lsp_references() end,                          nowait = true,                  desc = "References" },
    { "gri",             function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "grd",             function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "grD",             function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "grt",             function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
  }
}
