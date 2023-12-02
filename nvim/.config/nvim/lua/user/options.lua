local options = {
	showmatch = true,
	clipboard = "unnamedplus",
	incsearch = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	autoindent = true,
	rnu = true,
	nu = true,
	wildmode = "longest,list",
	scrolloff = 7,
	wrap = false,
	mouse = "a",
	splitright = true,
	splitbelow = true,
	ttyfast = true,
	swapfile = false,
	backupdir = "~/.cache/vim",
	textwidth = 80,
	termguicolors = true,
	bg = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g["sneak#streak"] = 1
vim.g.gruvbox_contrast_dark = "hard"

vim.cmd([[set termguicolors]])
vim.cmd([[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]])
