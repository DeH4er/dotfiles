local dapui = require("dapui")
dapui.setup({
	controls = {
		element = "repl",
		enabled = false,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = "",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.25,
				},
				{
					id = "breakpoints",
					size = 0.25,
				},
				{
					id = "stacks",
					size = 0.25,
				},
				{
					id = "watches",
					size = 0.25,
				},
			},
			position = "right",
			size = 40,
		},
		{
			elements = {
				-- {
				-- 	id = "repl",
				-- 	size = 0.5,
				-- },
				{
					id = "console",
					size = 1,
				},
			},
			position = "bottom",
			size = 10,
		},
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t",
	},
	render = {
		indent = 1,
		max_value_lines = 100,
	},
})

vim.keymap.set("n", "<leader>dub", function()
	require("dapui").float_element("breakpoints", { enter = true })
end)
vim.keymap.set("n", "<leader>dus", function()
	require("dapui").float_element("scopes", { enter = true })
end)
vim.keymap.set("n", "<leader>duw", function()
	require("dapui").float_element("watches", { enter = true })
end)

local dap = require("dap")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- ADAPTERS

-- browser
dap.adapters.firefox = {
  type = "executable",
  command = "firefox-debug-adapter"
}

-- rust
dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
	name = "lldb",
}

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = true, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
	--- A callback that determines how a variable is displayed or whether it should be omitted
	--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
	--- @param buf number
	--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
	--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
	--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
	--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
	display_callback = function(variable, buf, stackframe, node, options)
		-- by default, strip out new line characters
		if options.virt_text_pos == "inline" then
			return " = " .. variable.value:gsub("%s+", " ")
		else
			return variable.name .. " = " .. variable.value:gsub("%s+", " ")
		end
	end,
	-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
	virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

	-- experimental features:
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

-- HIGHLIGHTS FOR SYMBOLS
vim.api.nvim_set_hl(0, "DapBreakpointSymbol", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapBreakpointLine", { ctermbg = 0, fg = "", bg = "#31353f" })

vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })

vim.api.nvim_set_hl(0, "DapStoppedSymbol", { ctermbg = 0, fg = "#98c379", bg = "#313f35" })
vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, fg = "", bg = "#313f35" })

-- SYMBOLS
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DapBreakpointSymbol", linehl = "DapBreakpointLine", numhl = "" }
)
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "", linehl = "DapBreakpoint", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "" }
)
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "DapLogPoint", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStoppedSymbol", linehl = "DapStoppedLine", numhl = "" })

-- HIGHLIGHTS FOR ELEMENTS
vim.api.nvim_set_hl(0, "DapUIScope", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIDecoration", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIStepOver", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIStepInto", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIStepBack", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIStepOut", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUILineNumber", { link = "Identifier" })
vim.api.nvim_set_hl(0, "DapUIWinSelect", { ctermbg = 0, fg = "LightBlue", bold = true })
vim.api.nvim_set_hl(0, "DapUIType", { link = "StorageClass" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { link = "String" })
vim.api.nvim_set_hl(0, "DapUIThread", { link = "String" })
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { link = "String" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { link = "String" })
vim.api.nvim_set_hl(0, "DapUICurrentFrameName", { link = "String" })
vim.api.nvim_set_hl(0, "DapUISource", { link = "Constant" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { link = "Constant" })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { link = "Statement" })
