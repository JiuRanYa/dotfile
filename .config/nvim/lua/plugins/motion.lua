return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
{
    "ptdewey/yankbank-nvim",
    lazy = false,
    config = function()
        require('yankbank').setup()
    end,
}
}
