return {
  {
    "lewis6991/gitsigns.nvim",
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

      vim.keymap.set("n", "<leader>gc", ":Gitsigns next_hunk<CR>", { noremap = true, desc = "go to next hunk" })
      vim.keymap.set("n", "<leader>gC", ":Gitsigns prev_hunk<CR>", { noremap = true, desc = "go to previous hunk" })

      -- For some reason not working, as ]c and [c are already mapped by default!
      -- But deleting them here also does not work.
      vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", { noremap = true, desc = "go to next hunk" })
      vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { noremap = true, desc = "go to previous hunk" })
    end,
  },
}
