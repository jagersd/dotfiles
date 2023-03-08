local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "n",":NvimTreeToggle<CR>", {})

-- navigation panes
map("n","<leader>h",":wincmd h<CR>",{})
map("n","<leader>j",":wincmd j<CR>",{})
map("n","<leader>k",":wincmd k<CR>",{})
map("n","<leader>l",":wincmd l<CR>",{})
map("n","<C-d>","<C-d>zz",{})
map("n","<C-u>","<C-u>zz",{})

map("n","<leader>t",":ToggleTerm direction=float <CR>",{})

-- move selected items (thanks to theprimeagen)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigation tabs
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_implementations, {})

--get out of insert quicker
vim.keymap.set("i", "<C-c>", "<Esc>")

