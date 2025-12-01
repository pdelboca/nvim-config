local function get_tsserver_path()
  local node_path = vim.fn.trim(vim.fn.system('nvm which current | dirname'))
  return node_path .. '/tsserver'
end

return {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    tsserver = {
      path = get_tsserver_path()
    }
  },
}
