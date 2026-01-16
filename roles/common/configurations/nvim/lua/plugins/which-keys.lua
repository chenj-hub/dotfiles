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
      { "<leader>cm", group = "Goose Mode" },
      { "<leader>cr", group = "Goose Revert" },

      -- Goose.nvim specific keymaps
      { "<leader>co", desc = "Toggle Goose" },
      { "<leader>ci", desc = "Goose input" },
      { "<leader>cI", desc = "Goose input (new session)" },
      { "<leader>cO", desc = "Goose output" },
      { "<leader>ct", desc = "Toggle focus (Goose)" },
      { "<leader>cq", desc = "Close Goose" },
      { "<leader>cf", desc = "Toggle fullscreen (Goose)" },
      { "<leader>css", desc = "Select session (Goose)" },
      { "<leader>cmc", desc = "Goose chat mode" },
      { "<leader>cma", desc = "Goose auto mode" },
      { "<leader>cp", desc = "Configure provider (Goose)" },
      { "<leader>c.", desc = "Open config (Goose)" },
      { "<leader>c?", desc = "Inspect session (Goose)" },
      { "<leader>cd", desc = "Open diff (Goose)" },
      { "<leader>c]", desc = "Next diff (Goose)" },
      { "<leader>c[", desc = "Previous diff (Goose)" },
      { "<leader>cQ", desc = "Close diff (Goose)" },
      { "<leader>cra", desc = "Revert all (Goose)" },
      { "<leader>crt", desc = "Revert this (Goose)" },

      -- ChatGPT.nvim keymaps
      { "<leader>cg", desc = "ChatGPT" },
      { "<leader>cs", desc = "ChatGPT summarize" },
      { "<leader>ce", desc = "ChatGPT explain" },
      { "<leader>cG", desc = "ChatGPT grammar" },

      -- Claude Code keymap
      { "<leader>cc", desc = "Claude Code" },

      -- Copilot keymap
      { "<leader>ca", desc = "Copilot accept" },
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