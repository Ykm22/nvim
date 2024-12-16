vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp")
