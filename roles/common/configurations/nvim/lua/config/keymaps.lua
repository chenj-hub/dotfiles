local M = {}

function M.setup()
  -- Utility functions
  local function open_link()
    local url = vim.fn.expand("<cWORD>")
    if url ~= "" then
      vim.fn.jobstart({ "open", url })
    end
  end

  -- ============================================================================
  -- General Keymaps
  -- ============================================================================

  -- Open link under cursor
  vim.keymap.set('n', 'gx', open_link, { desc = 'Open link under cursor', noremap = true })

  -- Remove search highlights
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights', noremap = true, silent = true })

  -- Move focus between windows
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

  -- View PR (uses gh CLI, not plugin-specific)
  vim.keymap.set('n', '<leader>gp', '<cmd>!gh pr view --web || gh pr create --web<CR>', { desc = 'Git PR view/create', noremap = true, silent = true })

  -- ============================================================================
  -- Autocommands
  -- ============================================================================

  -- Remove trailing spaces on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
  })
end

return M
