-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end
})

-- NetRW
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 4
vim.g.netrw_winsize = 14
vim.g.netrw_keepdir = 0

-- Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

-- No backup, long-running undotree dir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Good colors
vim.opt.termguicolors = true

-- Scroll stops
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Update time
vim.opt.updatetime = 50

-- Auto-refresh files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    group = vim.api.nvim_create_augroup("AutoRefresh", { clear = true }),
    callback = function()
        -- Only checktime if not in command-line mode to avoid interrupting input
        if vim.fn.mode() ~= 'c' then
            vim.cmd('checktime')
        end
    end,
    pattern = "*", -- Apply to all files
})
-- Do not change directory automatically
vim.opt.autochdir = false

-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- VimTeX
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  build_dir = "build",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-pdf",
    "-interaction=nonstopmode",
    "-synctex=1",
    "-shell-escape",
  },
}
