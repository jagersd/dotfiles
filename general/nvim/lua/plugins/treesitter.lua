return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        dependencies = {
            { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
        },
        configs.setup({
            ensure_installed = { "go", "lua", "php", "vue", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
