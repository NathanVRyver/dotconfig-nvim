-- AstroCore Plugin Configuration
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Core feature configurations
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- Set limits for large files to disable heavy plugins like treesitter
      autopairs = true, -- Enable autopairs at startup
      cmp = true, -- Enable completion at startup
      diagnostics_mode = 3, -- Diagnostics mode at startup (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- Highlight URLs at startup
      notifications = true, -- Enable notifications at startup
    },

    -- Diagnostics configurations
    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    -- Vim options configuration
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {}, -- Set global vim variables if needed
    },

    -- Key Mappings
    mappings = {
      n = {
        -- Buffer navigation
        ["[b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["]b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Close buffer using Heirline's buffer picker
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
