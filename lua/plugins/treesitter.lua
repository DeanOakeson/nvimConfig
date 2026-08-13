vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Parser install location (only needed if you want a non-default path)
require('nvim-treesitter').setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

-- Replaces ensure_installed — install explicitly (async by default)
require('nvim-treesitter').install({
    "nix", "vim", "bash", "lua", "python", "rust",
    "json", "c", "cpp", "markdown", "java", "html",
})

-- Replaces highlight.enable = true
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "nix", "vim", "bash", "lua", "python", "rust",
        "json", "c", "cpp", "markdown", "java", "html",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
