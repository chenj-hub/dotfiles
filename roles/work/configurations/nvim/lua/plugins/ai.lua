return {
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
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
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              env = {
                api_key = 'cmd:security find-generic-password -a Google -s Gemini -w',
              },
            })
          end,
          openai = function()
            return require('codecompanion.adapters').extend('openai', {
              env = {
                api_key = 'cmd:security find-generic-password -a OpenAI -s ChatGPT -w',
              },
            })
          end,
          anthropic = function()
            return require('codecompanion.adapters').extend('anthropic', {
              env = {
                api_key = 'cmd:security find-generic-password -a Anthropic -s Claude -w',
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
              env = {
                ANTHROPIC_API_KEY = 'cmd:security find-generic-password -a Anthropic -s Claude -w',
              },
            })
          end,
          gemini_cli = function()
            return require('codecompanion.adapters').extend('gemini_cli', {
              defaults = { auth_method = 'gemini-api-key' },
              env = {
                GEMINI_API_KEY = 'cmd:security find-generic-password -a Google -s Gemini -w',
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
          goose = function()
            return require('codecompanion.adapters').extend('goose', {})
          end,
        },
      },
      interactions = {
        chat   = { adapter = 'codex' },
        inline = { adapter = 'gemini' },
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
