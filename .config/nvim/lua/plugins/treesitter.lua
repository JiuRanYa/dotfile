return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    opts = {
      ensure_installed = { "javascript", "html", "json", "vue", "typescript" },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',   -- charwise
            ['@function.outer'] = 'V',    -- linewise
            ['@class.outer'] = '<c-v>',   -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false
  }
}
