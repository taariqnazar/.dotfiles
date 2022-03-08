require 'colorizer'.setup()

require "nvim-treesitter.configs".setup {
    ensure_installed = {"python", "lua", "c", "rust", "typescript"},
    highlight = {
        enable = true,
        disable = {"c", "rust"}
    }
}

vim.cmd [[
    let g:nvcode_termcolors=256

    syntax on
    colorscheme nvcode

    if (has("termguicolors"))
        set termguicolors
        hi LineNr ctermbg=NONE guibg=NONE
    endif
]]
