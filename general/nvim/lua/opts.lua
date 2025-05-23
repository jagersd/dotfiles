local set = vim.opt

set.background = "dark"
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
set.hlsearch = false
set.incsearch = true
set.inccommand = "split"
set.mouse = "a"
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.scrolloff = 8
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.signcolumn = 'yes'
set.swapfile = false
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true

vim.api.nvim_create_augroup("CustomFiletypeSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "CustomFiletypeSettings",
    pattern = { "json", "yaml", "yml", "terraform" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
