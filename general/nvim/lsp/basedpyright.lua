---@type vim.lsp.Config
return {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        '.git',
    },
    settings = {
        basedpyright = {
            analysis = {
                diagnosticMode = 'openFilesOnly',
                reportMissingTypeStubs = 'none',
                reportUnusedImport = 'none',
                reportUnusedVariable = 'none',
                typeCheckingMode = 'basic',
            },
        },
    },
}
