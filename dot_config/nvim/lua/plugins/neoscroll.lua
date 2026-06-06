-- For smooth scrolling
vim.pack.add({
  "https://github.com/karb94/neoscroll.nvim",
})

local neoscroll = require("neoscroll")
neoscroll.setup({ duration_multiplier = 0.3 })
