local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require "lspkind"
lspkind.init()

local luasnip = require'luasnip'
require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require'cmp'
  cmp.setup({
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    --mapping = cmp.mapping.preset.insert({
    --  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --  ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --  ['<C-Space>'] = cmp.mapping.complete(),
    --  ['<C-e>'] = cmp.mapping.abort(),
    --  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --}),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
     ['<CR>'] = cmp.mapping.confirm({ select = true },{ "i", "s" }),
     ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
      elseif cmp.visible() then
          cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    },
     formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            nvim_lua = "[api]",
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
            luasnip = "[snip]",
            gh_issues = "[issues]",
            tn = "[TabNine]",
          },
        },
      },
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip' }, -- For luasnip users.
            }, {
          { name = 'buffer' },
     })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

