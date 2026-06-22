if not vim.pack then
    error('This config requires Neovim 0.12 or newer')
end

vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/neanias/everforest-nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/romgrk/barbar.nvim' },
    { src = 'https://github.com/akinsho/toggleterm.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'https://github.com/williamboman/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-buffer' },
    { src = 'https://github.com/hrsh7th/cmp-path' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help' },
    { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
    { src = 'https://github.com/zbirenbaum/copilot.lua' },
    { src = 'https://github.com/zbirenbaum/copilot-cmp' },
    { src = 'https://github.com/CopilotC-Nvim/CopilotChat.nvim' },
    { src = 'https://github.com/ray-x/guihua.lua' },
    { src = 'https://github.com/ray-x/go.nvim' },
    { src = 'https://github.com/grafana/vim-alloy' },
}, { load = true })

vim.api.nvim_create_user_command('PluginsUpdate', function()
    vim.pack.update()
end, { desc = 'Update plugins managed by vim.pack' })

vim.api.nvim_create_user_command('PluginsRemove', function(opts)
    vim.pack.del({ opts.args })
end, { nargs = 1, desc = 'Remove a plugin from disk' })

vim.api.nvim_create_user_command('PluginsStatus', function()
    local lines = { '# Plugins managed by vim.pack' }
    local opt_dir = vim.fn.stdpath('data') .. '/site/pack/core/opt'
    for _, name in ipairs(vim.fn.readdir(opt_dir)) do
        local dir = opt_dir .. '/' .. name
        local ok, info = pcall(vim.fn.systemlist, { 'git', '-C', dir, 'log', '--oneline', '-1' })
        local branch = ''
        if ok and info and #info > 0 then
            branch = ' (' .. info[1] .. ')'
        end
        table.insert(lines, '  - ' .. name .. branch)
    end
    vim.cmd('new')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'wipe'
    vim.bo.modified = false
    vim.api.nvim_buf_set_name(0, 'plugins://status')
end, { desc = 'Show installed plugins and their current commit' })

require('everforest').setup({
    background = 'hard',
})
vim.cmd.colorscheme('everforest')

require('mason').setup({
    ui = { border = 'rounded' },
})

local registry = require('mason-registry')
local packages = {
    'tree-sitter-cli',
    'bash-language-server',
    'basedpyright',
    'css-lsp',
    'emmet-ls',
    'gopls',
    'helm-ls',
    'intelephense',
    'lua-language-server',
    'rust-analyzer',
    'terraform-ls',
    'typescript-language-server',
}

registry.refresh(function()
    for _, name in ipairs(packages) do
        local package = registry.get_package(name)
        if not package:is_installed() then
            package:install()
        end
    end
end)

vim.g.barbar_auto_setup = false
require('barbar').setup({})

require('toggleterm').setup({
    float_opts = {
        border = 'curved',
    },
})

require('nvim-tree').setup({})
require('telescope').setup({})

require('gitsigns').setup({
    signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
    },
})

require('nvim-autopairs').setup({})

vim.env.NODE_NO_WARNINGS = '1'

require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})

require('copilot_cmp').setup()

require('CopilotChat').setup({
    sticky = { '#buffer:active' },
    debug = false,
    show_help = false,
    window = {
        layout = 'vertical',
        width = 0.4,
        height = 0.5,
    },
})

require('go').setup()

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
