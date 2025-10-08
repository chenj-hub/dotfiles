return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>G', '<cmd>Git<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gh', '<cmd>GBrowse<CR>', { noremap = true, silent = true })
      vim.keymap.set('v', '<leader>gh', ":<C-u>'<,'>GBrowse<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>dv', '<cmd>:Gvdiffsplit<CR>', { noremap = true, silent = true })
    end
  },
  {
    'tpope/vim-rhubarb',
  }
}
