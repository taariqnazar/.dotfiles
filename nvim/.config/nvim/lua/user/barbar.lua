local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<leader>.', ':BufferNext<CR>', opts)
map('n', '<leader>,', ':BufferPrevious<CR>', opts)

-- Re-order to previous/next
map('n', '<leader>h', ':BufferMovePrevious<CR>', opts)
map('n', '<leader>l', ' :BufferMoveNext<CR>', opts)


-- Goto buffer in position...
for i=1,10 do
    map('n', "<leader>"..i, ':BufferGoto '..i ..'<CR>', opts)
end

map('n', '<leader>c', ':BufferClose<CR>', opts)
map('n', '<leader>x', ':BufferCloseAllButCurrent<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<leader>bb', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bn', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

