return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.alloy = {
        install_info = {
            url = "https://github.com/mattsre/tree-sitter-alloy",
            files = { "src/parser.c" },
            branch = "main",
        },
        filetype = "alloy",
        }
        configs.setup({
            ensure_installed = { "go", "lua", "php", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}

