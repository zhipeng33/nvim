return {
  cmd = { 'neocmakelsp', '--stdio' },
  filetypes = { 'cmake' },
  root_markers = { '.git', 'build', 'cmake' },
  single_file_support = true,
  docs = {
    description = [[
https://github.com/Decodetalkers/neocmakelsp

CMake LSP Implementation

Neovim does not currently include built-in snippets. `neocmakelsp` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.

```lua
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.neocmake.setup {
  capabilities = capabilities,
}
```
]],
  },
}
