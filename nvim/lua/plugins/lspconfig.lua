return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      "williamboman/mason.nvim",
      config = true,
    },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },
  },

  config = function()
    require("lspconfig").lua_ls.setup({})
    require("lspconfig").clangd.setup({})

    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format()
    end)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my.lsp", {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if
          not client:supports_method("textDocument/willSaveWaitUntil")
          and client:supports_method("textDocument/formatting")
        then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end

        -- Creates a keymap to toggle inlay hints in your
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          vim.map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })
  end,
}
