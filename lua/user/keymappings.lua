
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Tab management
keymap("n", "<S-t>", ":tabnew<CR>", opts)
keymap("n", "<A-.>", ":tabnext<CR>", opts)
keymap("n", "<A-,>", ":tabprev<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)

-- Buffer managementj
keymap("n", "<S-h>", ":bp<CR>", opts)
keymap("n", "<S-l>", ":bn<CR>", opts)
keymap("n", "<S-c>", ":bd<CR>", opts)
keymap("n", "<leader>db", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<leader>fp", ":!black --target-version py311 %<CR>", opts)
keymap("n", "<leader>fi", ":!isort %<CR>", opts)

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

-- ✅ Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- ✅ Trouble (better quickfix window)
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "<leader>xc", "<cmd>TroubleClose<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<C-s>", ":Prettier :w<CR>", opts)

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Copilot
keymap("n", "[t", "<plug>(copilot-prev)", opts)
keymap("n", "]t", "<plug>(copilot-next)", opts)
