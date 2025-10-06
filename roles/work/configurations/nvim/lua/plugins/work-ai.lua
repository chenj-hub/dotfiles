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
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'minuet' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = {
      'nvim-cmp',
    },
    config = function()
      require('minuet').setup({
        provider = 'claude',
        provider_options = {
          claude = {
            model = 'claude-sonnet-4-5-20250929',
            api_key = function ()
              return vim.fn.system("security find-generic-password -a Anthropic -s Claude -w"):gsub("\n", "")
            end,
          },
        },
      })
    end,
  }
}
