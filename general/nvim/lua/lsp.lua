local servers = {
    bashls = {},
    cssls = {},
    emmet_ls = {},
    gopls = {},
    intelephense = {},
}

local lsp_group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = lsp_group,
    desc = 'LSP actions',
    callback = function(event)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = event.buf,
                silent = true,
                desc = desc,
            })
        end

        map('n', 'K', vim.lsp.buf.hover, 'LSP hover')
        map('n', 'gd', vim.lsp.buf.definition, 'LSP definition')
        map('n', 'gD', vim.lsp.buf.declaration, 'LSP declaration')
        map('n', 'gi', vim.lsp.buf.implementation, 'LSP implementation')
        map('n', 'go', vim.lsp.buf.type_definition, 'LSP type definition')
        map('n', 'gr', vim.lsp.buf.references, 'LSP references')
        map('n', 'gs', vim.lsp.buf.signature_help, 'LSP signature help')
        map('n', '<F2>', vim.lsp.buf.rename, 'LSP rename')
        map({ 'n', 'x' }, '<F3>', function()
            vim.lsp.buf.format({ async = true })
        end, 'LSP format')
        map('n', '<F4>', vim.lsp.buf.code_action, 'LSP code action')

        map('n', 'gl', vim.diagnostic.open_float, 'Line diagnostics')
        map('n', '[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, 'Previous diagnostic')
        map('n', ']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, 'Next diagnostic')
    end,
})

vim.diagnostic.config({
    float = { border = 'rounded' },
})

require('mason').setup({
    ui = { border = 'rounded' },
})

require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_enable = {
        exclude = { 'copilot' },
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server, config in pairs(servers) do
    config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('GoFormat', { clear = true }),
    pattern = '*.go',
    callback = function()
        require('go.format').goimport()
    end,
})

--No longer required after installing shellcheck through mason
--vim.api.nvim_create_autocmd('FileType', {
--  pattern = {'sh', 'zsh'},
--  callback = function()
--    vim.lsp.start({
--      name = 'bash-language-server',
--      cmd = { 'bash-language-server', 'start' },
--    })
--  end,
--})

--Caused some issues on hover
--local hoverGrp = vim.api.nvim_create_augroup("ShowHover", {clear = true})
--vim.api.nvim_create_autocmd("CursorHold", {
--    pattern = {"*.js,*.go,*.php,*.py,*.sh"},
--    command = "lua vim.lsp.buf.hover()",
--    group = hoverGrp,
--})
