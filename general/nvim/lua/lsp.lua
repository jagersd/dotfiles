vim.diagnostic.config({
    float = { border = 'rounded' },
    virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('*', {
    capabilities = capabilities,
})

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
