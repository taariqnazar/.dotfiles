local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	-- How to toggle NVIM TREE
	vim.keymap.set("n", "<C-n>", function()
		return api.tree.close()
	end, opts("Open NvimTree"))

	vim.keymap.set("n", "l", api.node.open.edit, opts("expand or open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("expand or open"))

	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	on_attach = my_on_attach,
	hijack_cursor = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		side = "left",
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	--    nvim_tree_icons = {
	--        default = "",
	--        symlink = "",
	--        git = {
	--            unstaged = "",
	--            staged = "S",
	--            unmerged = "",
	--            renamed = "➜",
	--            deleted = "",
	--            untracked = "U",
	--            ignored = "◌",
	--        },
	--        folder = {
	--            default = "",
	--            open = "",
	--            empty = "",
	--            empty_open = "",
	--            symlink = "",
	--        },
	--   },
})
