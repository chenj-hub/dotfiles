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
      ensure_installed = { "lua_ls", "gopls", "pylsp", "terraformls" }
    })

    local on_attach = function(_, _)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'gf', vim.lsp.buf.format, {})
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
    end

    local lspconf = require("lspconfig")

    lspconf.lua_ls.setup {
      on_attach = on_attach
    }

    lspconf.gopls.setup {
      on_attach = on_attach
    }

    lspconf.pylsp.setup {
      on_attach = on_attach
    }

    lspconf.terraformls.setup {
      on_attach = on_attach
    }

    lspconf.ruby_lsp.setup {
      on_attach = on_attach
    }

  end
}
