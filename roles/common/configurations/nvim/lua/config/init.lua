local M = {}


function M.setup()
  -- Enable necessary plugins and file type detection
  vim.cmd("filetype plugin indent on")

  -- Enable 24-bit RGB colors
  vim.opt.termguicolors = true
  vim.opt.encoding = "utf-8"

  -- Highlight comments in green
  vim.api.nvim_set_hl(0, "Comment", { ctermfg = "green" })

  -- Indentation
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.expandtab = true
  vim.opt.autoindent = true

  -- General editor settings
  vim.opt.hlsearch = true
  vim.opt.number = true
  vim.opt.ruler = true
  vim.opt.lazyredraw = true
  vim.opt.smartcase = true
  vim.opt.clipboard = "unnamedplus"
  vim.wo.colorcolumn = "80"
  vim.opt.conceallevel = 1
  vim.opt.background = "dark"

  -- Persistent undo setup
  if vim.fn.has('persistent_undo') == 1 then
    -- Create the undo directory if it does not exist
    local undodir = vim.fn.expand('$HOME/.vimhis')
    if not vim.fn.isdirectory(undodir) then
      vim.fn.mkdir(undodir, 'p')
    end

    -- Set the undodir and undo-related settings
    vim.opt.undodir = undodir
    vim.opt.undolevels = 5000
    vim.opt.undofile = true
  end
end

return M
