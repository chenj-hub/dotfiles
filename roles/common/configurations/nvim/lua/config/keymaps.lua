local M = {}

function M.setup()
  function open_link()
    local url = vim.fn.expand("<cWORD>")
    if url ~= "" then
      vim.fn.jobstart({ "open", url })
    end
  end

  -- Map the gx key combination to the open_link function
  vim.api.nvim_set_keymap('n', 'gx', ':lua open_link()<CR>', { noremap = true })

  -- View PR
  vim.keymap.set('n', '<leader>gp', '<cmd>!gh pr view --web || gh pr create --web<CR>', { noremap = true, silent = true })

  -- Remove search highlights
  vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })

  -- Open config files
  vim.keymap.set('n', '<leader>c', function()
    vim.cmd('cd ~/.config/nvim/')
    vim.cmd('tabnew ~/.config/nvim/lua/config/keymaps.lua')
    Toggle_neotree()
  end, { noremap = true, silent = true })

  -- Removes trailing spaces on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
  })
end

return M
