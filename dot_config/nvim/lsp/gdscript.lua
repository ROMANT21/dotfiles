local port = 6005
local cmd = vim.lsp.rpc.connect("127.0.0.1", port)

return {
  cmd = cmd,
  filetypes = { "gdscript" },
  root_markers = { "project.godot" },
}
