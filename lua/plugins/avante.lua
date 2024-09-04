return {
  {
    "yetone/avante.nvim", -- Avante.nvim's repository
    config = function()
      require("avante").setup {
        provider = "claude",
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20240620",
          api_key = os.getenv "ANTHROPIC_API_KEY", -- Load API key from environment variable
          temperature = 0,
          max_tokens = 4096,
        },
        -- Other configuration options here...
      }
    end,
  },
}
