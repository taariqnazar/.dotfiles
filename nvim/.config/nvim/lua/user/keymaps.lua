local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

--Remap Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Press jj for normal mode
keymap("i","jj", "<Esc>", opts)

-- Move line or visually seleted block
keymap("v", "J", ":m '>+1<CR>==gv", opts)
keymap("v", "K", ":m '<-2<CR>==gv", opts)

-- Paste over current word
keymap("n", "<C-p>", "cw<C-r>0<Esc>", opts)

-- Quicker navigation
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)
keymap("n", "J", "}", opts)
keymap("n", "K", "{", opts)

-- Move split panes
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move between panes
keymap("n", "<A-h>", "<A-w>h", opts)
keymap("n", "<A-j>", "<A-w>j", opts)
keymap("n", "<A-k>", "<A-w>k", opts)
keymap("n", "<A-l>", "<A-w>l", opts)

-- New line
keymap("n", "<Leader>o", 'o<Esc>0"_D', opts)
keymap("n", "<Leader>O", 'O<Esc>0"_D', opts)

-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

