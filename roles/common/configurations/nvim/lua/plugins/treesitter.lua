return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
        "bash",
        "c",
        "diff",
        "go",
        "hcl",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "terraform",
        "toml",
        "tsx",
        "typescript",
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
