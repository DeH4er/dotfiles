require("lazy").setup({
	spec = {
		{
			"luisiacc/gruvbox-baby",
			lazy = false,
			priority = 1000,
			config = function()
				vim.opt.background = "dark"
				vim.cmd.colorscheme("gruvbox-baby")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			event = "VeryLazy",
			build = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
			},
			config = function()
				require("config.telescope")
			end,
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("config.tree")
			end,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"williamboman/mason.nvim",
				"ray-x/lsp_signature.nvim",
			},
			config = function()
				require("config.lsp")
			end,
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
			config = function()
				require("config.cmp")
			end,
		},
		{
			"stevearc/conform.nvim",
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				require("config.format")
			end,
		},
		{
			"mfussenegger/nvim-lint",
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				require("config.lint")
			end,
		},
		{
			"yetone/avante.nvim",
			event = "VeryLazy",
			lazy = false,
			version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
			opts = {
				-- add any opts here
				-- provider = "anthropic",
				mappings = {
					ask = "<leader>la",
					edit = "<leader>le",
					refresh = "<leader>lr",
				},
			},
			-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
			build = "make",
			-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
			dependencies = {
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				--- The below dependencies are optional,
				"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
				-- {
				-- 	-- support for image pasting
				-- 	"HakonHarnes/img-clip.nvim",
				-- 	event = "VeryLazy",
				-- 	opts = {
				-- 		-- recommended settings
				-- 		default = {
				-- 			embed_image_as_base64 = false,
				-- 			prompt_for_file_name = false,
				-- 			drag_and_drop = {
				-- 				insert_mode = true,
				-- 			},
				-- 			-- required for Windows users
				-- 			use_absolute_path = true,
				-- 		},
				-- 	},
				-- },
				{
					-- Make sure to set this up properly if you have lazy=true
					"MeanderingProgrammer/render-markdown.nvim",
					opts = {
						file_types = { "markdown", "Avante" },
					},
					ft = { "markdown", "Avante" },
				},
			},
		},
		{
			"mfussenegger/nvim-dap",
			event = "VeryLazy",
			dependencies = {
				"rcarriga/nvim-dap-ui",
				"nvim-neotest/nvim-nio",
				-- "ldelossa/nvim-dap-projects",
				"theHamsta/nvim-dap-virtual-text",
			},
			config = function()
				require("config.dap")
				require("config.dap-projects")
			end,
		},
		-- {
		-- 	"github/copilot.vim",
		-- },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox-baby" } },
	-- automatically check for plugin updates
	-- checker = { enabled = true },
})
