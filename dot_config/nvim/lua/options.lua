local o = vim.opt
local g = vim.g

-- Leader Keys
g.mapleader = ' '
g.maplocalleader = '//'

-- Indent to 2 spaces
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.smartindent = true -- Change indentation based on surrounding syntax
o.expandtab = true   -- Replaces tabs with spaces

-- Reread files when they're changed outside nvim
o.autoread = true

-- Show line numbers relative to cursor
o.number = true
o.relativenumber = true

-- Hide command line
o.cmdheight = 0

-- Don't wrap lines
o.wrap = false

-- Designate column for diagnostics
o.signcolumn = 'yes'

-- Create vertical col
o.colorcolumn = '100'

-- Completion menu settings
o.completeopt = { 'menuone', 'popup' }

-- Rounded border on floating window
o.winborder = 'rounded'

-- Smart search
o.ignorecase = true
o.smartcase = true

-- Don't create swap file
o.swapfile = false

-- Yank/paste from clipboard
o.clipboard = "unnamedplus"

-- Commandline height
o.cmdheight = 1
