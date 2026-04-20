return {
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
    },
    keys = {
      { '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'Toggle Chat' },
      { '<leader>ca', '<cmd>CodeCompanionActions<cr>',     mode = { 'n', 'v' }, desc = 'Actions' },
      { '<leader>ci', '<cmd>CodeCompanion<cr>',            mode = { 'n', 'v' }, desc = 'Inline' },
      { '<leader>cA', '<cmd>CodeCompanionChat Add<cr>',    mode = 'v',          desc = 'Add to Chat' },
      { '<leader>gm', '<cmd>CodeCompanion /commit <cr>',   mode = { 'n', 'v' }, desc = 'Generate a commit message' },
    },
    opts = {
      adapters = {
        http = {
          openai = function()
            return require('codecompanion.adapters').extend('openai', {
              env = {
                api_key = 'cmd:security find-generic-password -a OpenAI -s ChatGPT -w',
              },
            })
          end,
        },
        acp = {
          claude_code = function()
            return require('codecompanion.adapters').extend('claude_code', {
              commands = {
                default = { 'npx', '@zed-industries/claude-code-acp' },
              },
            })
          end,
          codex = function()
            return require('codecompanion.adapters').extend('codex', {
              commands = {
                default = { 'npx', '@zed-industries/codex-acp' },
              },
              defaults = { auth_method = 'openai-api-key' },
              env = {
                OPENAI_API_KEY = 'cmd:security find-generic-password -a OpenAI -s ChatGPT -w',
              },
            })
          end,
        },
      },
      interactions = {
        chat   = { adapter = 'codex' },
        inline = { adapter = 'openai' },
        cmd    = { adapter = 'claude_code' },
      },
      opts = { log_level = 'ERROR' },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "security find-generic-password -a OpenAI -s ChatGPT -w",
      })

      vim.keymap.set('n', '<leader>cg', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
      vim.keymap.set('n', '<C-s>g', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
      vim.keymap.set({ 'n', 'v' }, '<leader>cs', '<cmd>ChatGPTRun summarize<CR>', { desc = 'ChatGPT summarize' })
      vim.keymap.set({ 'n', 'v' }, '<C-s>x', '<cmd>ChatGPTRun explain_code<CR>', { desc = 'ChatGPT explain' })
      vim.keymap.set({ 'n', 'v' }, '<leader>cG', '<cmd>ChatGPTRun grammar_correction<CR>', { desc = 'ChatGPT grammar' })
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
          ['<C-y>'] = require('minuet').make_cmp_map(),
      })})
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
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
            keymap = {
              accept_and_goto = '<leader>cn',
              accept          = false,
              dismiss         = '<leader>cd',
            }
          }
        })
      end,
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
        },
      })
    end,
  }
}
