-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.filetype.add({
  extension = {
    endo = "endo",
  },
})

-- Endo language LSP (Neovim 0.11+ native API)
vim.lsp.config("endo", {
  cmd = { "/home/christianparpart/projects/endo/build/clang-debug/src/shell/endo", "--lsp" },
  filetypes = { "endo" },
  root_markers = { ".git" },
})
vim.lsp.enable("endo")

-- Colorscheme handling (follows the terminal's dark/light theme) lives in config/theme.lua,
-- registered from the onedarkpro spec in plugins/common.lua.

-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "CmdwinEnter" }, {
--   pattern = "*",
--   callback = function()
--     vim.wo.number = true
--     vim.wo.relativenumber = true
--     vim.wo.conceallevel = 0
--     vim.wo.cursorline = true
--   end,
-- })
