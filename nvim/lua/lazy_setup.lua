require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^4",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
      update_notifications = true,
    },
  },

  { import = "community" },
  { import = "plugins" },

  {
    "xiyaowong/nvim-transparent",
    lazy = true, -- Lazy load this plugin
    event = "VeryLazy", -- Load on specific event
    config = function()
      require("transparent").setup {
        extra_groups = { -- Specify groups to make transparent
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
        },
        exclude_groups = { "tree" }, -- Exclude specific groups from being transparent
      }
      vim.api.nvim_command "TransparentEnable" -- Enable transparency using Lua API
    end,
  },
}, {
  -- Global Setup Options
  install = { colorscheme = { "ellisonleao/gruvbox.nvim", "astrodark", "habamax", "" } },
  ui = { backdrop = 90 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "man",
        "matchit", -- Consider disabling these if not used
      },
    },
  },
})
