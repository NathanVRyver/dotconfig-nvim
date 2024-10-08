return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files
          hide_dotfiles = false, -- Do not hide files starting with a dot
          hide_gitignored = false, -- Show git ignored files
        },
      },
    }
  end,
}
