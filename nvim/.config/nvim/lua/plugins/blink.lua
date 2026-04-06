vim.pack.add({
   {
     src = "https://github.com/saghen/blink.cmp",
     version = "v1.10.2",
   },
})

local blinkcmp = require("blink.cmp")
blinkcmp.setup({
  keymap = { preset = 'super-tab' },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  snippets = {
    preset = 'default',
  },

  -- This helps with the floating window look
  completion = {
    menu = { border = 'rounded' },
    documentation = { window = { border = 'rounded' } },
  }
})
