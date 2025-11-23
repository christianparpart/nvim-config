return {
  {
    "lewis6991/gitsigns.nvim",
    options = {
      current_line_blame = true,
      signs = {
        add = { text = "▐" },
        change = { text = "▐" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▐" },
        untracked = { text = "🮙" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
    },
    config = function()
      vim.keymap.set(
        "n",
        "<leader>hs",
        ":Gitsigns stage_hunk<CR>",
        { noremap = true, desc = "git stage hunk - using Gitsigns" }
      )

      vim.keymap.set(
        "n",
        "<leader>hu",
        ":Gitsigns undo_stage_hunk<CR>",
        { noremap = true, desc = "git undo stage hunk - using Gitsigns" }
      )

      vim.keymap.set(
        "n",
        "<leader>hr",
        ":Gitsigns reset_hunk<CR>",
        { noremap = true, desc = "git reset hunk - using Gitsigns" }
      )

      vim.keymap.set("n", "<leader>hn", ":Gitsigns next_hunk<CR>", { noremap = true, desc = "go to next hunk" })
      vim.keymap.set("n", "<leader>hp", ":Gitsigns prev_hunk<CR>", { noremap = true, desc = "go to previous hunk" })

      -- For some reason not working, as ]c and [c are already mapped by default!
      -- But deleting them here also does not work.
      vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", { noremap = true, desc = "go to next hunk" })
      vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { noremap = true, desc = "go to previous hunk" })
    end,
  },
}
