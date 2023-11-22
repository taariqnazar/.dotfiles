local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Press jj for normal mode
keymap("i", "jj", "<Esc>", opts)

-- Move line or visually seleted block
keymap("v", "<C-j>", ":m '>+1<CR>==gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>==gv", opts)

-- Paste over current word
keymap("n", "<C-p>", "cw<C-r>0<Esc>", opts)

-- Quicker navigation
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("v", "H", "^", opts)

keymap("n", "J", "<C-d>zz", opts)
keymap("n", "K", "<C-u>zz", opts)
keymap("v", "J", "<C-d>zz", opts)
keymap("v", "K", "<C-u>zz", opts)

-- Move split panes
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", opts)

-- Move between panes
keymap("n", "<A-h>", "<A-w>h", opts)
keymap("n", "<A-j>", "<A-w>j", opts)
keymap("n", "<A-k>", "<A-w>k", opts)
keymap("n", "<A-l>", "<A-w>l", opts)

-- New line
keymap("n", "<Leader>o", 'o<Esc>0"_D', opts)
keymap("n", "<Leader>O", 'O<Esc>0"_D', opts)

-- Blocks
keymap("n", "<Leader>mb", "[m", opts) -- Beginning of previous block
keymap("n", "<Leader>mB", "[M", opts) -- End of previous block
keymap("n", "<Leader>nb", "]m", opts) -- Beginning of next block
keymap("n", "<Leader>nB", "]M", opts) -- End of next block

keymap("n", "<Leader>mf", "[{", opts) -- beginning of current block
keymap("n", "<Leader>mF", "[[", opts)
keymap("n", "<Leader>nf", "]}", opts) -- end of current block
keymap("n", "<Leader>nF", "]]", opts)

-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
