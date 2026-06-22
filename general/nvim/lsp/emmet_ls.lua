---@type vim.lsp.Config
return {
    cmd = { 'emmet-ls', '--stdio' },
    filetypes = {
        'css',
        'eruby',
        'html',
        'javascriptreact',
        'less',
        'php',
        'sass',
        'scss',
        'typescriptreact',
    },
    root_markers = { 'package.json', '.git' },
}
