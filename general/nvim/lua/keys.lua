local map = vim.keymap.set
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
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- navigation tabs
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)

--telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fr', builtin.lsp_references, {})
map('n', '<leader>fd', builtin.lsp_implementations, {})

--gitsigns
map("n", "<leader>c",":Gitsigns preview_hunk_inline<CR>",{})
map("n", "<leader>b",":Gitsigns blame_line<CR>",{})

--copilot
map("n", "<leader>p",":Copilot enable<CR>", {})
map("n", "<leader>pp","[[<Cmd>lua require('cmp').complete({ config = { sources = copilot_only_sources } })<CR>]]", opts)
map("n", "<leader>l",":CopilotChat ", {})
map("n","<leader>;",":CopilotChatToggle<CR>",{})
map("n","<leader>:",":CopilotChatReset<CR>",{})

--get out of insert quicker
map("i", "<C-c>", "<Esc>")

