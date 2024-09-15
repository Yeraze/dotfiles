-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").pyright.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").sourcekit.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").perlpls.setup({})

require("mini.surround").setup({
  highlight_duration = 5000,
})
