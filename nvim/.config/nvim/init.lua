--[[ Inspired by: https://erock-git-dotfiles.pgs.sh/tree/main/item/dot_config/nvim/init.lua.html
]]
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

local opts = { silent = true } -- Don't echo key mapping in cmd area
local map = vim.keymap.set

-- Terminal keybindings
map('n', '<leader>t', '<CMD>term zsh<CR>', opts)
map('t', '<ESC>', [[<C-\><C-n>]], opts) -- exit terminal mode

-- Window pane navigation
map('n', '<C-k>', '<CMD>wincmd k<CR>', opts) -- navigate splits
map('n', '<C-j>', '<CMD>wincmd j<CR>', opts)
map('n', '<C-h>', '<CMD>wincmd h<CR>', opts)
map('n', '<C-l>', '<CMD>wincmd l<CR>', opts)

-- Get rid of highlighting from search
map('n', '<leader>nh', '<CMD>nohlsearch<CR>', opts)

-- Show diagnostics
map('n', '<S-D>', vim.diagnostic.open_float, opts)

-- Plugins
vim.pack.add({
  -- Theme
	"https://github.com/folke/tokyonight.nvim",

  -- Auto config for nvim lsps
	"https://github.com/neovim/nvim-lspconfig",

  -- Smooth scrolling
	"https://github.com/karb94/neoscroll.nvim",

  -- Autocompletion
  "https://github.com/saghen/blink.cmp",

  -- Telescope
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

-- Configure plugins
vim.cmd("colorscheme tokyonight-night")

function setup_neoscroll()
  local neoscroll = require("neoscroll")
  neoscroll.setup({ duration_multiplier = 0.3 })
end
setup_neoscroll()

function setup_blink()
  local blinkcmp = require("blink.cmp")
  blinkcmp.setup({
    keymap = { preset = 'super-tab' },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    
    -- This helps with the floating window look
    completion = {
      menu = { border = 'rounded' },
      documentation = { window = { border = 'rounded' } },
    }
  })
end
setup_blink()

function setup_lsp()
  local lsp = vim.lsp
  local blinkcmp = require('blink.cmp')

  -- Setup keymaps
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local opts = { buffer = args.buf }
      vim.keymap.set('n', 'K', lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', lsp.buf.definition, opts)
      vim.keymap.set('n', 'gt', lsp.buf.type_definition, opts)
      vim.keymap.set('n', 'grn', lsp.buf.rename, opts)
    end,
  })

  local servers = { 'pyright', 'lua_ls', 'rust_analyzer' }
  for _, server in ipairs(servers) do
    lsp.config(server, {
      capabilities = blinkcmp.get_lsp_capabilities()
    })

    lsp.enable(server)
  end
end
setup_lsp()

function setup_telescope()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope find references' })
end
setup_telescope()
