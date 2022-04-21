require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.svls.setup{}

local map = require("core.utils").map
map("n", "<leader>fr", ":Files <CR>")
