-- AstroCore Plugin Configuration
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Core feature configurations
    features = {
      large_buf = {
        size = 1024 * 500,
        lines = 10000,
        disable_plugins = { "treesitter", "lsp" }, -- Disable Treesitter and LSP for large files
      },
      autopairs = true, -- Enable autopairs at startup
      cmp = {
        completion = { completeopt = "menu,menuone,noselect" }, -- Improve completion behavior
        mapping = require("cmp").mapping.preset.insert {
          ["<CR>"] = require("cmp").mapping.confirm { select = true }, -- Confirm with Enter
          ["<Tab>"] = require("cmp").mapping.select_next_item(),
          ["<S-Tab>"] = require("cmp").mapping.select_prev_item(),
        },
      }, -- Enable completion at startup and improve keybindings
      diagnostics_mode = 3, -- Diagnostics mode at startup (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- Highlight URLs at startup
      notifications = {
        timeout = 3000, -- Notification timeout in milliseconds
        stages = "slide", -- Notification appearance style
      }, -- Enable notifications at startup
    },

    -- Diagnostics configurations
    diagnostics = {
      virtual_text = {
        spacing = 4, -- Add some spacing to diagnostics text
        severity = { min = vim.diagnostic.severity.WARN }, -- Show only warnings and errors
      },
      underline = true, -- Underline errors
      signs = true, -- Show signs in sign column
    },

    -- Vim options configuration
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- Show relative line numbers
        number = true, -- Show line numbers
        spell = false, -- Disable spell checking
        signcolumn = "yes", -- Always show sign column
        wrap = false, -- Disable line wrapping
      },
      g = { -- Set global vim variables
        mapleader = " ", -- Set leader key to space
        autoformat_enabled = true, -- Enable automatic formatting
      },
    },

    -- Key Mappings
    mappings = {
      n = {
        -- Buffer navigation
        ["[b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["]b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Close buffer using heirline's buffer picker
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Quick save and quit
        ["<Leader>w"] = { ":w<CR>", desc = "Save current file" },
        ["<Leader>q"] = { ":q<CR>", desc = "Quit current window" },

        -- Window navigation
        ["<C-h>"] = { "<C-w>h", desc = "Move to left window" },
        ["<C-l>"] = { "<C-w>l", desc = "Move to right window" },
        ["<C-j>"] = { "<C-w>j", desc = "Move to window below" },
        ["<C-k>"] = { "<C-w>k", desc = "Move to window above" },
      },
    },
  },
}
