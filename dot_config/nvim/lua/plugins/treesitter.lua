 -- Treesitter config
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

treesitter = require('nvim-treesitter')
treesitter.setup()
treesitter.install({'python', 'lua'})
