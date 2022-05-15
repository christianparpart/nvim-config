local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- ✅ MY PLUGINS HERE
    use "wbthomason/packer.nvim"        -- Have packer manage itself
    use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"         -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs"         -- Autopairs, integrates with both cmp and treesitter
    use "lewis6991/gitsigns.nvim"       -- Git status meta information in left vertical-bar
    use 'tpope/vim-fugitive'            -- Git for vim
    use "akinsho/toggleterm.nvim"       -- Embedded term on C-\
    use "folke/which-key.nvim"
    use "yggdroot/indentline"           -- visualize indentation levels
    use 'editorconfig/editorconfig-vim' -- tweaks local VIM session based on .editorconfig
    use "lukas-reineke/indent-blankline.nvim"
    use "puremourning/vimspector"
    use "machakann/vim-highlightedyank"
    use "tomtom/tcomment_vim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use 'kyazdani42/nvim-web-devicons'
    -- use 'kyazdani42/nvim-tree.lua'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- ✅ Colorschemes
    use "lunarvim/colorschemes"       -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "lifepillar/vim-gruvbox8"
    use "joshdick/onedark.vim"

    -- snippets
    -- use "L3MON4D3/LuaSnip" --snippet engine
    -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    -- use "SirVer/ultisnips"
    -- use "mlaursen/vim-react-snippets"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- cmp completions
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- Bufferline
    use "akinsho/bufferline.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Prettier
    use "prettier/vim-prettier"

    -- Github copilot
    -- use "github/copilot.vim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

