require("config.set")
require("config.lazy")
require("config.colorscheme")
require("config.treesitter")
require("config.harpoon2")
require("config.netrw")
require("config.remap")

-- LSPs
require("lsp.lua")
require("lsp.python")
-- Load Latex only when the servers listens to /tmp/nvim
if vim.v.servername == "/tmp/nvim" then
    require("lsp.latex")
end
