vim.cmd.colorscheme("everforest")
vim.g.everforest_background = "hard"
vim.cmd.syntax("on")

--local group = vim.api.nvim_create_augroup("Markdown per filetype", { clear = true })
--
--vim.api.nvim_create_autocmd('BufEnter', {
--  pattern = {'*.vue,*.css,*.html'},
--  group = group,
--  command = 'setlocal shiftwidth=2 softtabstop=2'
--})
--
