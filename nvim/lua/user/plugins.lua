vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
  use 'ellisonleao/gruvbox.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- utils
  use 'folke/lua-dev.nvim'

  -- LSP use 'neovim/nvim-lspconfig' -- enable LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'ray-x/lsp_signature.nvim'
  use 'SmiteshP/nvim-navic'
  use 'simrat39/symbols-outline.nvim'
  use 'b0o/SchemaStore.nvim'
  use 'RRethy/vim-illuminate'
  use 'j-hui/fidget.nvim'
  use 'lvimuser/lsp-inlayhints.nvim'

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-emoji"
  -- use "hrsh7th/cmp-nvim-lua"
  -- use "zbirenbaum/copilot-cmp"
  -- use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e",
  -- run = "./install.sh" }

  -- Snippet
  use "L3MON4D3/LuaSnip"

  -- Fuzzy Finder/Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

  use { 'johmsalas/text-case.nvim', config = {
    require 'textcase'.setup {}
  } }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
