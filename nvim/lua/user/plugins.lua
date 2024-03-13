vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
  use 'luisiacc/gruvbox-baby'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- utils
  use 'folke/neodev.nvim'

  use 'simrat39/rust-tools.nvim'
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

  -- Snippet
  use "L3MON4D3/LuaSnip"

  -- Fuzzy Finder/Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use 'f-person/git-blame.nvim'

  use 'github/copilot.vim'

  use 'dyng/ctrlsf.vim'
end)
