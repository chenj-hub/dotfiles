return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" }, -- shfmt is generally preferred for Bash/Sh scripts
        bash = { "shfmt" },
        py = { "ruff" },
        json = { "jq" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "4", "-ci" }, -- Indent size of 4, simplify syntax
        },
      },
    },
  },
}
