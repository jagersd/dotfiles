vim.cmd.colorscheme("everforest")
vim.cmd.syntax("on")

local tabGrp = vim.api.nvim_create_augroup("Markdown per filetype", { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.yml,*.yaml,*.ini,*.toml'},
    group = tabGrp,
    command = 'setlocal shiftwidth=2 softtabstop=2'
})
