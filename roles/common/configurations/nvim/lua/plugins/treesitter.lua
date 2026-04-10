return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "go",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      highlight = {
        enable = true,
        -- disable = { "markdown", "markdown_inline" }
      },
      indent = {
        enable = true,
      },
    })
  end,
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
  }
}
