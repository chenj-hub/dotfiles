return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({
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
    })
    vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<CR>', { desc = 'Toggle tree', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tr', '<cmd>Neotree current reveal_force_cwd<CR>', { desc = 'Reveal in tree', noremap = true, silent = true })
  end
}
