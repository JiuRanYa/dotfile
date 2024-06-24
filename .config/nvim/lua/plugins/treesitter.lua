return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    opts = {
      ensure_installed = { "javascript", "html", "json", "vue", "typescript" },
      -- 启用代码缩进模块 (=)
      indent = {
        enable = true,
      },
    }
  },
}
