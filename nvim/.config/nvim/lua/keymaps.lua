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

