local set = vim.opt

set.background = 'dark'
set.clipboard = 'unnamedplus'
set.completeopt = 'menuone,noinsert,noselect'
set.cursorline = true
set.expandtab = true
set.foldmethod = 'manual'
set.hlsearch = false
set.inccommand = 'split'
set.incsearch = true
set.mouse = 'a'
set.number = true
set.relativenumber = true
set.scrolloff = 8
set.shiftwidth = 4
set.signcolumn = 'yes'
set.smarttab = true
set.softtabstop = 4
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 4
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true

vim.filetype.add({
    extension = {
        alloy = 'alloy',
    },
})

vim.cmd.syntax('on')
