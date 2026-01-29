return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      -- Define group labels for better organization
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Tree/Toggle" },
      { "<leader>c", group = "Code/AI" },
      { "<leader>l", group = "LSP" },
      { "<leader>d", group = "Diff/Diagnostics" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
