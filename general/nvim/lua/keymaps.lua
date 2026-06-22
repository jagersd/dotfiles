local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>n', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })

map('n', '<leader>h', '<Cmd>wincmd h<CR>', opts)
map('n', '<leader>j', '<Cmd>wincmd j<CR>', opts)
map('n', '<leader>k', '<Cmd>wincmd k<CR>', opts)
map('n', '<leader>l', '<Cmd>wincmd l<CR>', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<leader>t', '<Cmd>ToggleTerm direction=float<CR>', opts)

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)

local ok_telescope, builtin = pcall(require, 'telescope.builtin')
if ok_telescope then
    map('n', '<leader>ff', builtin.find_files, opts)
    map('n', '<leader>fg', builtin.live_grep, opts)
    map('n', '<leader>fb', builtin.buffers, opts)
    map('n', '<leader>fh', builtin.help_tags, opts)
    map('n', '<leader>fr', builtin.lsp_references, opts)
    map('n', '<leader>fd', builtin.lsp_implementations, opts)
end

map('n', '<leader>c', '<Cmd>Gitsigns preview_hunk_inline<CR>', opts)
map('n', '<leader>b', '<Cmd>Gitsigns blame_line<CR>', opts)

map('n', '<leader>p', '<Cmd>Copilot enable<CR>', opts)
map('n', '<leader>pp', function()
    local ok, cmp = pcall(require, 'cmp')
    if not ok then
        vim.notify('nvim-cmp is not available', vim.log.levels.WARN)
        return
    end

    cmp.complete({
        config = {
            sources = {
                { name = 'copilot' },
            },
        },
    })
end, opts)
map('n', '<leader>.', ':CopilotChat ', { noremap = true })
map('n', '<leader>;', '<Cmd>CopilotChatToggle<CR>', opts)
map('n', '<leader>:', '<Cmd>CopilotChatReset<CR>', opts)

map('i', '<C-c>', '<Esc>', opts)
