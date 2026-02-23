return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "security find-generic-password -a OpenAI -s ChatGPT -w",
      })

      vim.keymap.set('n', '<C-s>g', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
      vim.keymap.set({ 'n', 'v' }, '<C-s>u', '<cmd>ChatGPTRun summarize<CR>', { desc = 'ChatGPT summarize' })
      vim.keymap.set({ 'n', 'v' }, '<C-s>x', '<cmd>ChatGPTRun explain_code<CR>', { desc = 'ChatGPT explain' })
      vim.keymap.set({ 'n', 'v' }, '<C-s>m', '<cmd>ChatGPTRun grammar_correction<CR>', { desc = 'ChatGPT grammar' })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
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
          ['<C-s>y'] = require('minuet').make_cmp_map(),
          ['<C-s>b'] = cmp.mapping.scroll_docs(-4),
          ['<C-s>f'] = cmp.mapping.scroll_docs(4),
          ['<C-s>s'] = cmp.mapping.complete(),
          ['<C-s>e'] = cmp.mapping.abort(),
          ['<C-s>r'] = cmp.mapping.confirm({ select = true }),
          ['<C-s>j'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-s>k'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        performance = { fetching_timeout = 2000 },
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = 'minuet' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    dependencies = {
      'copilotlsp-nvim/copilot-lsp',
    },
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        nes = {
          enabled = true,
        }
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'copilot.lua',
    },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = {
      'nvim-cmp',
    },
    config = function()
      require('minuet').setup({
        provider = 'gemini',
        provider_options = {
          openai = {
            model = 'gpt-4o-mini',
            api_key = function()
              return vim.fn.system("security find-generic-password -a OpenAI -s ChatGPT -w"):gsub("\n", "")
            end,
          },
          claude = {
            model = 'claude-haiku-4-5',
            api_key = function()
              return vim.fn.system("security find-generic-password -a Anthropic -s Claude -w"):gsub("\n", "")
            end,
          },
          gemini = {
            model = 'gemini-2.5-flash-lite',
            api_key = function()
              return vim.fn.system("security find-generic-password -a Google -s Gemini -w"):gsub("\n", "")
            end,
          },
        },
      })
    end,
  }
}
