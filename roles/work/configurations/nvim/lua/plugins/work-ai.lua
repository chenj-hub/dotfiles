return {
  {
    "azorng/goose.nvim",
    config = function()
      require("goose").setup({})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
        },
      }
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "security find-generic-password -a OpenAI -s ChatGPT -w",
      })

      vim.keymap.set("n", "<leader>gp", "<cmd>ChatGPT<CR>")
      vim.keymap.set({ 'n', 'v' }, '<leader>gs', '<cmd>ChatGPTRun summarize<CR>')
      vim.keymap.set({ 'n', 'v' }, "<leader>ge", "<cmd>ChatGPTRun explain_code<CR>")
      vim.keymap.set({ 'n', 'v' }, "<leader>gc", "<cmd>ChatGPTRun grammar_correction<CR>")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup()

      vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
    end
  },
  {
    'github/copilot.vim',
  }
}
