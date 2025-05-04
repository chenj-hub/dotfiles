return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignore = false,
      }
    },
  },
  config = function()
    require('neo-tree').setup()
    vim.keymap.set('n', '<leader>t', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>r', '<cmd>Neotree current reveal_force_cwd<CR>', { noremap = true, silent = true })
  end
}
