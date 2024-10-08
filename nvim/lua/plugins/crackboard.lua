return {
  {
    "boganworld/crackboard.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crackboard").setup {
        session_key = "dfbb6db77269fd8643ad34b4a6866ec4b60f4d5cfa33cc559cfdf0e26b1c7827",
      }
    end,
  },
}
