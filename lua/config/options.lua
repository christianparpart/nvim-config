-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.conceallevel = 0
vim.wo.cursorline = true
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8
vim.wo.foldmethod = "expr"
-- vim.wo.foldenable = true
vim.wo.foldminlines = 4
vim.wo.colorcolumn = "110"

vim.bo.expandtab = true
-- vim.g.lazyvim_check_order = false

-- Enable Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
