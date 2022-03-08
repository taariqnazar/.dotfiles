local lspkind = require "lspkind"
lspkind.init()

vim.o.completeopt = "menu,menuone,noselect"
local cmp = require'cmp'
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

cmp.setup{
    mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-Space>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<c-e>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
  },
  ["<Tab>"] = cmp.mapping(
  function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
  end,
  {"i", "s", "c" }
  ),
  ["<S-Tab>"] = cmp.mapping(
  function(fallback)
      cmp_ultisnips_mappings.jump_backwards(fallback)
  end,
  {"i", "s", "c" }
  )

  },
    sources = {
        { name = "gh_issues" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "ultisnips" },
        { name = "buffer"},
    },

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.k
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            luasnip = "[snip]",
            gh_issues = "[issues]",
            tn = "[TabNine]",
          },
        },
      },

      experimental = {
        native_menu = false,

        ghost_text = false,
      },
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})
