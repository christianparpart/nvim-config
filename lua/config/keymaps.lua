-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if false then
  -- Shorten function name
  local keymap = vim.api.nvim_set_keymap

  local opts = { noremap = true, silent = true }

  -- execute recorded macro in register q:
  -- vim.cmd [[ nnoremap <C-Space> @q ]]
  keymap("n", "<C-Space>", "@q", opts)

  -- ✅ Better window navigation
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)

  -- ✅ Resize with arrows
  keymap("n", "<C-Up>", ":resize -2<CR>", opts)
  keymap("n", "<C-Down>", ":resize +2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

  -- Terminal --
  -- Better terminal navigation
  local term_opts = { silent = true }
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

  keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

  -- keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
  keymap(
    "n",
    "<C-p>",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts
  )
  keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

  -- Copilot
  keymap("n", "[t", "<plug>(copilot-prev)", opts)
  keymap("n", "]t", "<plug>(copilot-next)", opts)
  keymap("i", "<A-,>", "<plug>(copilot-prev)", opts)
  keymap("i", "<A-.>", "<plug>(copilot-next)", opts)
end
