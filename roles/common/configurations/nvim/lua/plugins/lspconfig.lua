return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim",  opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ansiblels", "bashls", "lua_ls", "gopls", "pylsp", "ruby_lsp", "terraformls" }
    })

    local on_attach = function(_, _)
      vim.keymap.set('n', 'md', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'mi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'mf', vim.lsp.buf.format, {})
      vim.keymap.set('n', 'mr', require('telescope.builtin').lsp_references, {})
      vim.keymap.set('n', 'mh', vim.lsp.buf.hover, {})
    end

    local lspconf = require("lspconfig")

    lspconf.ansiblels.setup {
      on_attach = on_attach
    }

    lspconf.bashls.setup {
      on_attach = on_attach
    }

    lspconf.lua_ls.setup {
      on_attach = on_attach
    }

    lspconf.gopls.setup {
      on_attach = on_attach
    }

    lspconf.pylsp.setup {
      on_attach = on_attach
    }

    lspconf.ruby_lsp.setup {
      on_attach = on_attach
    }

    lspconf.terraformls.setup {
      on_attach = on_attach
    }
  end
}
