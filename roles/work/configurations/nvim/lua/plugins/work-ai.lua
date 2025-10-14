return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "security find-generic-password -a OpenAI -s ChatGPT -w",
      })

      vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>")
      vim.keymap.set({ 'n', 'v' }, '<leader>cgs', '<cmd>ChatGPTRun summarize<CR>')
      vim.keymap.set({ 'n', 'v' }, "<leader>cge", "<cmd>ChatGPTRun explain_code<CR>")
      vim.keymap.set({ 'n', 'v' }, "<leader>cgg", "<cmd>ChatGPTRun grammar_correction<CR>")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
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
          ["<C-\\>"] = require('minuet').make_cmp_map(),
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
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>"
          }
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
        provider = 'openai_compatible',
        request_timeout = 120,
        provider_options = {
          openai = {
            model = 'gpt-5',
            api_key = function()
              return vim.fn.system("security find-generic-password -a OpenAI -s ChatGPT -w"):gsub("\n", "")
            end,
          },
          gemini = {
            model = 'gemini-2.5-flash',
            api_key = function()
              return vim.fn.system("security find-generic-password -a Google -s Gemini -w"):gsub("\n", "")
            end,
          },
          openai_compatible = {
            model = 'goose-claude-3-7-sonnet',
            end_point = 'https://block-lakehouse-production.cloud.databricks.com/serving-endpoints/chat/completions',
            api_key = function()
              return vim.fn.system("security find-generic-password -a Databrick -s API -w"):gsub("\n", "")
            end,
            name = 'Databricks',
            stream = true,
            optional = {
              max_tokens = 256
            },
          }
        },
      })
    end,
  }
}
