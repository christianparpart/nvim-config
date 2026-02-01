return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>uf",
        function()
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          vim.notify(
            "Format on save: " .. (vim.b.disable_autoformat and "disabled" or "enabled"),
            vim.log.levels.INFO
          )
        end,
        desc = "Toggle format on save (buffer)",
      },
    },
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
      },
      format_on_save = function(bufnr)
        if vim.b[bufnr].disable_autoformat then
          return nil
        end
        local ft = vim.bo[bufnr].filetype
        if ft == "cpp" or ft == "c" then
          return {
            timeout_ms = 3000,
            lsp_fallback = true,
          }
        end
        return nil
      end,
    },
  },
}
