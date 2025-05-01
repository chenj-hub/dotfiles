local M = {}


function M.setup()
  -- Enable necessary plugins and file type detection}
  vim.cmd([[
    filetype plugin indent on
    set termguicolors
    set encoding=utf-8
  ]])

  -- Highlight comments in green
  vim.api.nvim_set_hl(0, "Comment", { ctermfg = "green" })

  -- Indentation
  vim.o.shiftwidth = 2
  vim.o.tabstop = 2
  vim.o.expandtab = true

  -- General editor settings
  vim.o.hlsearch = true
  vim.o.number = true
  vim.o.ruler = true
  vim.o.lazyredraw = true
  vim.o.smartcase = true
  vim.o.clipboard = "unnamedplus"
  vim.wo.colorcolumn = "80"
  vim.o.conceallevel = 1

  vim.o.background = "dark"

  -- Auto indent settings
  vim.o.autoindent = true

  -- keymaps
  -- Enable 24-bit RGB colors
  vim.o.termguicolors = true

  -- Persistent undo setup
  if vim.fn.has('persistent_undo') == 1 then
    -- Create the undo directory if it does not exist
    local undodir = vim.fn.expand('$HOME/.vimhis')
    if not vim.fn.isdirectory(undodir) then
      vim.fn.mkdir(undodir, 'p')
    end

    -- Set the undodir and undo-related settings
    vim.o.undodir = undodir
    vim.o.undolevels = 5000
    vim.o.undofile = true
  end
end

return M
