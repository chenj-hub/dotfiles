return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup{
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
      }
    }

    -- Buffer navigation keymaps
    vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bc', '<cmd>bdelete<CR>', { desc = 'Close buffer', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<CR>', { desc = 'List buffers', noremap = true, silent = true })
  end
}
