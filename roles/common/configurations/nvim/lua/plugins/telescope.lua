return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    local builtin = require('telescope.builtin')
    -- Primary find keymaps following <leader>f group
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })

    -- Legacy keybinds for muscle memory
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Live grep' })
  end
}
