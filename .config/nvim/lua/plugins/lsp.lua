return {
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require("neodev").setup({})
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    -- use commit
    dependencies = {
      "j-hui/fidget.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "glepnir/lspsaga.nvim",
      "onsails/lspkind.nvim",
      -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      "folke/neodev.nvim",
    },
    opts = {
      servers = {
        dartls = {},
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",  -- optional
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "vue-language-server",
        "tailwindcss-language-server",
        "html-lsp",
      },
    },
    config = function()
      require("mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
}
