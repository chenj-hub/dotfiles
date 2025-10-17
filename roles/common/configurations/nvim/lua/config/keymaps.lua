local M = {}

function M.setup()
  function toggle_neotree()
    vim.cmd('Neotree toggle')
    vim.cmd('wincmd p')
  end

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
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })

  -- Move focus between windows
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- Removes trailing spaces on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
  })
end

return M
