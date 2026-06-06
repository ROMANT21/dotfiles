 -- LSP configs
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

local lsp = vim.lsp
local blinkcmp = require('blink.cmp')

-- Setup keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'K', lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'gt', lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'grn', lsp.buf.rename, opts)
  end,
})

local servers = { 'pyright', 'lua_ls', 'rust_analyzer', 'ruby_lsp', 'html', 'clojure_lsp' }
for _, server in ipairs(servers) do
  lsp.config(server, {
    capabilities = blinkcmp.get_lsp_capabilities()
  })

  lsp.enable(server)
end

-- Disable conjure's shift+k override for docs
vim.g["conjure#mapping#doc_word"] = false
