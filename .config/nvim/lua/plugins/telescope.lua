return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<Leader>f",  "<cmd>Telescope find_files hidden=true<CR>", {} },
      { "<Leader>o",  ":Telescope lsp_document_symbols<CR>",       {} },
      { "<Leader>rs", ":Telescope resume<CR>",                     {} },
      { "<C-q>",      ":Telescope oldfiles<CR>",                   {} },
      { "fi",         "<cmd>Telescope import<CR>",                 desc = "Import Modules [Telescope]" }
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "es", "lib", "dist" },
      },
      pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
      extensions = {
        import = {
          -- Add imports to the top of the file keeping the cursor in place
          insert_at_top = false,
          -- Support additional languages
        },
      },
    },
  },
  -- Lazy
  {
    'piersolenski/telescope-import.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      require("telescope").load_extension("import")
    end
  }
}
