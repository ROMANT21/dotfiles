require("options")
require("keymaps")
require("plugins")

if vim.fn.isdirectory("custom_plugins") then
  require("custom_plugins")
end
