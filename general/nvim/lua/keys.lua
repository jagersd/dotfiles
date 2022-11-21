local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "n",":NvimTreeToggle<CR>", {})

-- navigation panes
map("n","<leader>h",":wincmd h<CR>",{})
map("n","<leader>j",":wincmd j<CR>",{})
map("n","<leader>k",":wincmd k<CR>",{})
map("n","<leader>l",":wincmd l<CR>",{})

-- navigation tabs
-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
