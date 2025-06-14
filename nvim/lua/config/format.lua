local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt" },
	},
	-- format_on_save = {
	-- 	lsp_fallback = true,
	-- 	async = false,
	-- 	timeout_ms = 500,
	-- },
})

vim.keymap.set({ "n", "v" }, "<leader>=", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
