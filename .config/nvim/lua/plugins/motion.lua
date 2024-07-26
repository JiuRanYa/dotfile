return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
{
    "ptdewey/yankbank-nvim",
    config = function()
        require('yankbank').setup()
    end,
}
}
