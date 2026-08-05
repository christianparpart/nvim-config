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

      vim.keymap.set("n", "<leader>ts", function()
        vim.lsp.buf.typehierarchy("subtypes")
      end, { desc = "Show sub types" })

      vim.keymap.set("n", "<leader>tS", function()
        vim.lsp.buf.typehierarchy("subtypes")
      end, { desc = "Show super types" })

      -- LspClangdSwitchSourceHeader is buffer-local, created only where clangd attaches.
      local function switch_source_header()
        if vim.fn.exists(":LspClangdSwitchSourceHeader") == 2 then
          vim.cmd("LspClangdSwitchSourceHeader")
        else
          vim.notify("clangd is not attached to this buffer", vim.log.levels.WARN)
        end
      end

      -- <A-o> only reaches Neovim when the terminal sends Alt as a Meta prefix.
      -- macOS composes instead, so Option+o arrives as the literal "ø"; map both,
      -- plus <leader>ch, which is independent of terminal and keyboard layout.
      for _, lhs in ipairs({ "<A-o>", "ø", "<leader>ch" }) do
        vim.keymap.set("n", lhs, switch_source_header, { desc = "Switch (C++) header/source" })
      end

      vim.lsp.inlay_hint.enable(true)

      vim.keymap.set("n", "<leader>ti", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not is_enabled)
      end, { desc = "Toggle Inlay Hints" })

      vim.keymap.set("n", "<leader>gd", function()
        vim.lsp.buf.definition()
      end, { desc = "Go to Definition" })

      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { desc = "Go to Definition" })

      vim.keymap.set("n", "gr", function()
        vim.lsp.buf.references()
      end, { desc = "All references" })

      vim.keymap.set("n", "<leader>gD", function()
        vim.lsp.buf.declaration()
      end, { desc = "Go to Definition" })

      vim.keymap.set("n", "<leader>gr", function()
        vim.lsp.buf.references()
      end, { desc = "Go to References" })

      vim.keymap.set("n", "]d", function()
        vim.lsp.diagnostic.goto_next({ border = "rounded" })
      end, { desc = "Go to Next Diagnostic" })

      vim.keymap.set("n", "[d", function()
        vim.lsp.diagnostic.goto_prev({ border = "rounded" })
      end, { desc = "Go to Previous Diagnostic" })

      vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float({ border = "rounded" })
      end, { desc = "Show Line Diagnostics" })

      vim.keymap.set("n", "<leader>fd", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format Document" })

      vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "Code Action" })

      vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, { desc = "Rename symbol" })

      -- my old config:
      -- local opts = { noremap = true, silent = true }
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fd", '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
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
