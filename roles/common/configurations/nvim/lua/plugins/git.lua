return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status', noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gb', '<cmd>GBrowse<CR>', { desc = 'Git browse', noremap = true, silent = true })
      vim.keymap.set('v', '<leader>gb', ":<C-u>'<,'>GBrowse<CR>", { desc = 'Git browse selection', noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', { desc = 'Git log', noremap = true, silent = true })
      vim.keymap.set('n', '<leader>dv', '<cmd>Gvdiffsplit<CR>', { desc = 'Diff view', noremap = true, silent = true })

      -- View PR (uses gh CLI, not plugin-specific)
      vim.keymap.set('n', '<leader>gp', '<cmd>!gh pr view --web || gh pr create --web<CR>', { desc = 'Git PR view/create', noremap = true, silent = true })

  -- ============================================================================
    end
  },
  {
    'tpope/vim-rhubarb',
  }
}
