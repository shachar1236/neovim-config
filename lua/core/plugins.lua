-- setting lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local plugins = {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
        "m4xshen/autoclose.nvim",
        "nvim-tree/nvim-tree.lua",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
          -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
          -- animation = true,
          -- insert_at_start = true,
          -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    { 
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        config = function()
          require('core.plugin_config.nvim-cmp')
        end,
    },
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    {
        "joechrisellis/lsp-format-modifications.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "Exafunction/codeium.vim",
    },
    {
        "terrortylor/nvim-comment",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
    },
    {
        "karb94/neoscroll.nvim"
    },
    {
        "rmagatti/auto-session"
    },
    {
        "f-person/git-blame.nvim"
    }
}

-- setting plugins
require("lazy").setup(plugins, opts)
