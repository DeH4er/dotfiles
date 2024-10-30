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
  -- use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use { 'nvimtools/none-ls.nvim', requires = { 'nvimtools/none-ls-extras.nvim' } } -- for formatters and linters
  use 'ray-x/lsp_signature.nvim'
  use 'SmiteshP/nvim-navic'
  use 'simrat39/symbols-outline.nvim'
  use 'b0o/SchemaStore.nvim'
  use 'RRethy/vim-illuminate'
  use 'j-hui/fidget.nvim'
  use 'lvimuser/lsp-inlayhints.nvim'

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- Snippet
  use "L3MON4D3/LuaSnip"

  -- Fuzzy Finder/Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree
  -- use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { "~/source/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }

  use 'f-person/git-blame.nvim'
  use 'github/copilot.vim'
  use 'dyng/ctrlsf.vim'

  use {
    "wojciech-kulik/xcodebuild.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup({
        code_coverage = {
          enabled = true,
        },
      })

      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>",
        { desc = "Toggle Xcodebuild Logs", silent = true })
      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project", silent = true })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project", silent = true })
      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests", silent = true })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class", silent = true })
      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>",
        { desc = "Show All Xcodebuild Actions", silent = true })
      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device", silent = true })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan", silent = true })
      vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>",
        { desc = "Toggle Code Coverage", silent = true })
      vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>",
        { desc = "Show Code Coverage Report", silent = true })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List", silent = true })
    end,
  }
  use {
    'rgroli/other.nvim',
    config = function()
      require 'other-nvim'.setup {
        rememberBuffers = false,
        mappings = {
          {
            pattern = "/(.*)/(.*).tsx$",
            target = "/%1/%2.test.tsx",
            context = "test"
          },
          {
            pattern = "/(.*)/(.*).tsx$",
            target = "/%1/%2.module.scss",
            context = "scss"
          },
          {
            pattern = "/(.*)/(.*).test.tsx$",
            target = "/%1/%2.tsx",
            context = "tsx"
          },
          {
            pattern = "/(.*)/(.*).test.tsx$",
            target = "/%1/%2.module.scss",
            context = "scss"
          },
          {
            pattern = "/(.*)/(.*).module.scss$",
            target = "/%1/%2.tsx",
            context = "tsx"
          },
          {
            pattern = "/(.*)/(.*).module.scss$",
            target = "/%1/%2.test.tsx",
            context = "test"
          },
          {
            pattern = "/(.*)/(.*).ts$",
            target = "/%1/%2.test.ts",
            context = "test"
          },
          {
            pattern = "/(.*)/(.*).test.ts$",
            target = "/%1/%2.ts",
            context = "ts"
          },
        },
        hooks = {
          -- This hook which is executed when the file-picker is shown.
          -- It could be used to filter or reorder the files in the filepicker.
          -- The function must return a lua table with the same structure as the input parameter.
          --
          -- The input parameter "files" is a lua table with each entry containing:
          -- @param table (filename (string), context (string), exists (boolean))
          -- @return table | boolean When an empty table or false is returned the filepicker is not openend.
          filePickerBeforeShow = function(files)
             local filtered = vim.tbl_filter(function(file)
              return not file.filename:match("test.test") and not file.filename:match("test.module")
            end, files)

            local order = { tsx = 1, ts = 2, test = 20, scss = 30 }
            table.sort(filtered, function(a, b)
              return order[a.context] < order[b.context]
            end)
            return filtered
          end,
        }
      }
    end
  }
end)
