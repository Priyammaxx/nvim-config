-- vim.opt.guicursor = ""

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' }, -- Apply to 'c' and 'cpp' filetypes
  callback = function()
    -- These options are set locally for the current buffer (setlocal)
    -- They will override any global settings for C/C++ files.

    -- 4-space tab indentation for C/C++
    vim.opt_local.tabstop = 4       -- Display tabs as 4 spaces
    vim.opt_local.shiftwidth = 4    -- Indent by 4 spaces
    vim.opt_local.expandtab = false -- Use actual tab characters
    vim.opt_local.softtabstop = 4   -- Tab/Backspace in insert mode moves 4 spaces

    -- You might also want these C/C++ specific indentation options
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    -- vim.opt_local.cindent = true      -- Enable C-style indentation rules (highly recommended for C/C++)

    -- Other C/C++ specific settings you might want:
    vim.opt_local.commentstring = '// %s' -- Set comment string for 'gc' and other comment plugins
    vim.opt_local.formatoptions = 'tcroq' -- Adjust how comments and lines are formatted (e.g., wrap comments)
  end,
  -- You can optionally add an augroup to manage these autocmds.
  -- This is good practice to ensure they are cleared when reloading config.
  group = vim.api.nvim_create_augroup('C_CPP_Settings', { clear = true }),
})

vim.opt.nu = true
vim.opt.relativenumber = true

-- if text doesn't fit, then display in next line
vim.opt.breakindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- if text doesn't fit, then display in next line
vim.opt.smartindent = true
vim.opt.autoindent = true

-- show line on which cursor is focused with different color
vim.opt.cursorline = true

vim.opt.showmode = false

vim.opt.wrap = false --maybe change it later?

--[[
-- Undo-tree things, when installed
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--]]

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.modifiable = true

vim.g.mapleader = " "

-- configure how new splits are opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- see `:help list`
-- see `:help listchar`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' } -- nbsp: non-breakng spaces

-- if an operation fails due to unsaved changes
-- raise a dialogue asking if you wish to save the current file(s)
vim.o.confirm = true

vim.opt.laststatus = 3
vim.o.winbar = "%=%f"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('pj-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
