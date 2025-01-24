local plugin = require("nvim-tree")
-- local lib = require "nvim-tree.lib"
-- local utils = require "nvim-tree.utils"
-- local filters = require "nvim-tree.explorer.filters"
-- local reloaders = require "nvim-tree.actions.reloaders"

local default_filters = {
	git_ignored = true,
	dotfiles = false,
	git_clean = false,
	no_buffer = false,
	no_bookmark = false,
	exclude = {},
	custom = {
		"^.git$",
	},
}

-- local function reload()
--   local node = lib.get_node_at_cursor()
--   reloaders.reload_explorer()
--   utils.focus_node_or_parent(node)
-- end
--
-- local function toggle_hidden_files()
--   local are_files_hidden = false
--
--   for _, filter_value in pairs(filters.config) do
--     if type(filter_value) == "table" then
--       are_files_hidden = are_files_hidden or #filter_value > 0
--     elseif type(filter_value) == "boolean" then
--       are_files_hidden = are_files_hidden or filter_value
--     end
--
--     if are_files_hidden then
--       break
--     end
--   end
--
--   for filter_name, default_value in pairs(default_filters) do
--     if are_files_hidden then
--       if type(default_value) == "table" then
--         filters.config["filter_" .. filter_name] = {}
--       elseif type(default_value) == "boolean" then
--         filters.config["filter_" .. filter_name] = false
--       end
--     else
--       filters.config["filter_" .. filter_name] = default_value
--     end
--   end
--
--   reload()
-- end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "l", api.node.open.no_window_picker, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Vertical Split"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Horizontal Split"))
	-- vim.keymap.set('n', '.',     toggle_hidden_files,                  opts('Toggle Hidden Filter'))
end

plugin.setup({
	on_attach = on_attach,
	filters = default_filters,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
})
