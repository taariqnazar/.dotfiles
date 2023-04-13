-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  fg0      = "#fbf1c7",
  fg1      = '#ebdbb2',
  fg2      = '#d5c4a1',
  fg3      = '#bdae93',
  fg4      = '#a89984',
  bg0      = '#282828',
  bg1      = '#3c3836',
  bg2      = '#504945',
  bg3      = '#665c54',
  bg4      = '#7c6f64',
  gray     = "#a89984",
  bg       = '#32302f',
  fg       = '#bbc2cf',
  yellow   = '#fabd2f',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#8ec07c',
  orange   = '#fe8019',
  violet   = '#b16286',
  magenta  = '#d3869b',
  blue     = '#83a598',
  red      = '#fb4934',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	"mode",
	color = { fg = colors.bg0, bg = colors.gray, gui = "bold" },
})

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.yellow, gui = "bold" },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.fg1, gui = "bold" },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg1, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

--ins_left {
-- Lsp server name .
--  function()
--    local msg = 'No Active Lsp'
--    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--    local clients = vim.lsp.get_active_clients()
--    if next(clients) == nil then
--      return msg
--    end
--    for _, client in ipairs(clients) do
--      local filetypes = client.config.filetypes
--      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--        return client.name
--      end
--    end
--    return msg
--  end,
--  icon = '',
--  color = { fg = '#ffffff', gui = 'bold' }, }

-- Add components to right sections
ins_right({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

-- Now don't forget to initialize lualine
lualine.setup(config)

--local custom_gruvbox = require("lualine.themes.gruvbox")

--require("lualine").setup({
--	options = { theme = custom_gruvbox },
--})
