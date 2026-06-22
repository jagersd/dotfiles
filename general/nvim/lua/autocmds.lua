local groups = {
    filetypes = vim.api.nvim_create_augroup('CustomFiletypeSettings', { clear = true }),
    lsp = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
    go = vim.api.nvim_create_augroup('GoFormat', { clear = true }),
}

vim.api.nvim_create_autocmd('FileType', {
    group = groups.filetypes,
    pattern = { 'alloy', 'dosini', 'json', 'terraform', 'toml', 'yaml' },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = groups.lsp,
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

vim.api.nvim_create_autocmd('BufWritePre', {
    group = groups.go,
    pattern = '*.go',
    callback = function()
        local ok, go_format = pcall(require, 'go.format')
        if ok then
            go_format.goimports()
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NativeTreesitter', { clear = true }),
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
