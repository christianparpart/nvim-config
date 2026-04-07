-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

-- vim.g.lazyvim_check_order = false

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        if vim.o.background == "light" then
          vim.cmd.colorscheme("onelight")
        else
          vim.cmd.colorscheme("onedark")
        end
      end,
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  { "nvim-telescope/telescope-media-files.nvim" },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "cpp",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "vim",
        "yaml",
      },
    },
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  { "github/copilot.vim" },

  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, desc = "git status" }) --git status
      vim.keymap.set("n", "<leader>ga", ":Git add ", { noremap = true, desc = "git add " })
      vim.keymap.set("n", "<leader>gp", ":Git push --quiet <CR>", { noremap = true, desc = "git push" })
      vim.keymap.set("n", "<leader>gc", ':Git commit -qam "', { noremap = true, desc = "git commit -am" })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = true,
    keys = {
      -- toggle terminal
      -- stylua: ignore
      {
        "<leader>tt",
        function() require("toggleterm").toggle(0) end,
        desc = "Toggle Terminal"
      },
    },
  },

  { "editorconfig/editorconfig-vim" },

  {
    "puremourning/vimspector",
    keys = {
      -- start/stop vimspector
      -- stylua: ignore
      {
        "<leader>dr",
        function() vim.cmd("VimspectorRestart") end,
        desc = "Vimspector: Restart"
      },
      {
        "<leader>dc",
        function()
          vim.cmd("VimspectorContinue")
        end,
        desc = "Vimspector: Continue",
      },
      {
        "<leader>de",
        function()
          vim.cmd("VimspectorBalloonEval")
        end,
        desc = "Vimspector: Evaluate",
      },
      {
        "<leader>dt",
        function()
          vim.cmd("VimspectorRunToCursor")
        end,
        desc = "Vimspector: Run to Cursor",
      },
      {
        "<leader>dR",
        function()
          vim.cmd("VimspectorReset")
        end,
        desc = "Vimspector: Reset",
      },
      {
        "<leader>ds",
        function()
          vim.cmd("VimspectorToggle")
        end,
        desc = "Vimspector: Start/Stop",
      },
    },
  },

  -- {
  --   "mfussenegger/nvim-dap",
  --   lazy = true,
  --   -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and modified.
  --   keys = {
  --     {
  --       "<leader>db",
  --       function()
  --         require("dap").toggle_breakpoint()
  --       end,
  --       desc = "Toggle Breakpoint",
  --     },
  --     {
  --       "<leader>dc",
  --       function()
  --         require("dap").continue()
  --       end,
  --       desc = "Continue",
  --     },
  --     {
  --       "<leader>dC",
  --       function()
  --         require("dap").run_to_cursor()
  --       end,
  --       desc = "Run to Cursor",
  --     },
  --     {
  --       "<leader>dT",
  --       function()
  --         require("dap").terminate()
  --       end,
  --       desc = "Terminate",
  --     },
  --   },
  -- },

  { "dag/vim-fish" }, -- fish shell syntax
  { "rhysd/conflict-marker.vim" }, -- Better highlight of git conflict markers and ability to easier jump around
  { "lunarvim/colorschemes" },
  { "prettier/vim-prettier" },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        show_hidden = true,
      },
    },
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })
    end,
  },

  -- lazy.nvim
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
    },
  },
}
