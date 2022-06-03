local M = {}

M.plugins = {
    user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

-- example of changing theme:
--M.ui = {
--   theme = "gruvchad",
--}

return M
