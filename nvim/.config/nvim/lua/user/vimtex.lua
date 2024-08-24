vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_compiler_latexmk = {
  out_dir = ".vimtex",
}
vim.g.vimtex_syntax_enabled = 1
