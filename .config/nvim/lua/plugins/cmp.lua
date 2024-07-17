return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    opts = function()
      local cmp = require("cmp")

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          ["<C-k>"] = cmp.mapping.select_prev_item(),
          -- 下一个
          ["<C-j>"] = cmp.mapping.select_next_item(),
          -- abort
          ["<C-c>"] = cmp.mapping.abort(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),

        sources = {
          { name = "luasnip",                priority = 60 },
          { name = "nvim_lsp",               priority = 90 },
          -- { name = "cmp_tabnine", priority = 98, max_item_count = 2, keyword_length = 3 },
          { name = "buffer",                 priority = 80 },
          { name = "path",                   priority = 80 },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lua" },
          { name = "vsnip" },
          {
            name = "html-css",
            option = {
              enable_on = {
                "html",
                "vue"
              },                                           -- set the file types you want the plugin to work on
              file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
              style_sheets = {
                -- example of remote styles, only css no js for now
                "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
              }
            }
          },
        }
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
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "rafamadriz/friendly-snippets",
    },
  },
  -- {
  --   "Jezda1337/nvim-html-css",
  --   event = { "BufReadPost", "BufNewFile" },
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-lua/plenary.nvim"
  --   },
  --   config = function()
  --     require("html-css"):setup()
  --   end
  -- }
}
