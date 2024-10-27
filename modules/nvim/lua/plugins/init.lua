return {
    {
        'aktersnurra/no-clown-fiesta.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('colorscheme no-clown-fiesta')
        end,
    },

    {
        'xiyaowong/transparent.nvim',
        opts = {},
        config = function()
            vim.cmd('TransparentEnable')
        end,
    },

    { 
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = { 'lua', 'nix' },
            auto_install = true,
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    {
        'stevearc/oil.nvim',
        opts = {},
    }
}
