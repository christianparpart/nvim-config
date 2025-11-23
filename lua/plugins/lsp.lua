return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "clangd" },
      })

      -- <leader>ht to toggle InlayHints
      vim.keymap.set("n", "<leader>ti", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not is_enabled)
      end, { desc = "Toggle Inlay Hints" })
    end,
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {}, -- pyright will be automatically installed with mason and loaded with lspconfig
        clangd = {},
      },
    },
  },
}
