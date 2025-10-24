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

    local servers = { "ansiblels", "bashls", "lua_ls", "gopls", "pylsp", "ruby_lsp", "terraformls", "yamlls" }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    local on_attach = function(_, _)
      vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'LSP definition' })
      vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'LSP format' })
      vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references, { desc = 'LSP references' })
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { desc = 'LSP hover' })
    end

    for _, name in ipairs(servers) do
      vim.lsp.config(name, { on_attach = on_attach })
      vim.lsp.enable(name)
    end
  end
}

