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
      vim.keymap.set('n', 'md', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'mi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'mf', vim.lsp.buf.format, {})
      vim.keymap.set('n', 'mr', require('telescope.builtin').lsp_references, {})
      vim.keymap.set('n', 'mh', vim.lsp.buf.hover, {})
    end

    for _, name in ipairs(servers) do
      vim.lsp.config(name, { on_attach = on_attach })
      vim.lsp.enable(name)
    end
  end
}

