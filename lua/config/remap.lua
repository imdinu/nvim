-- Global Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
vim.keymap.set("n", "<leader>ps",
    function()
        builtin.grep_string({ search = vim.fn.input("grep: ") });
    end,
    { desc = "Telescope grep string" }
)
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Harpoon 2
-- local harpoon = require("harpoon")
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add current file" })
-- keymap set in harpoon2.lua to use telescope
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    -- { desc = "Harpoon toggle quick menu" })

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon previous file" })
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next file" })

-- Grapple
local grapple = require("grapple") 

-- Move selected text
vim.keymap.set("n", "H", "^", { desc = "Move to start of line" })
vim.keymap.set("n", "L", "$", { desc = "Move to end of line" })
-- vim.keymap.set("n", "<C-h>", "H", { desc = "Move to the top of the current screen" })
-- vim.keymap.set("n", "<C-l>", "L", { desc = "Move to the bottom of the current screen" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard coppy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard (line)" })

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive git status" })
