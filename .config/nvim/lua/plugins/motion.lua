return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
{
    "ptdewey/yankbank-nvim",
    event = "VeryLazy",
    config = function()
        require('yankbank').setup()
    end,
}
}
