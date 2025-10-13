--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.colorcolumn = "120"

vim.diagnostic.config({ virtual_lines = true })

vim.o.winborder = "rounded"

-- To be able to proccess windows saved files.
vim.o.fileformats = "unix,dos"
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.o.cmdheight = 1

vim.g.copilot_auth_provider_url = 'https://etraid.ghe.com'
