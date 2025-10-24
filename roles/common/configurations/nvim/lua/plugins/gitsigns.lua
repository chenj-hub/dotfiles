return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Git preview hunk' })
  end
}
