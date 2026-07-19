local ok, lualine = pcall(require, 'lualine')
if ok then
    lualine.setup({
        sections = {
            lualine_c = {{ 'filename', path = 1 }}
        }
    })
end
