vim.diagnostic.config({
    float = { border = 'rounded' },
    virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.codelens.enable(false)

vim.lsp.config('terraformls', {
    -- nvim-lspconfig enables code lens on attach, which makes terraform-ls
    -- render a reference count above every block. :CodeLensToggle owns this.
    on_attach = function() end,
})

vim.api.nvim_create_user_command('CodeLensToggle', function()
    local enabled = not vim.lsp.codelens.is_enabled()
    vim.lsp.codelens.enable(enabled)
    vim.notify(('code lens: %s'):format(enabled and 'on' or 'off'))
end, { desc = 'Toggle LSP code lens' })

vim.lsp.enable({
    'bashls',
    'basedpyright',
    'cssls',
    'emmet_ls',
    'gopls',
    'helm_ls',
    'intelephense',
    'rust_analyzer',
    'terraformls',
    'ts_ls',
})
