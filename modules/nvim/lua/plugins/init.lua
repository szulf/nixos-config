local function map(key, action, desc)
    vim.keymap.set('n', key, action, { desc = desc })
end

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
        'nvim-telescope/telescope.nvim',

        dependencies = {
            { 'nvim-lua/plenary.nvim' },

            { 'BurntSushi/ripgrep' },

            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },

            { 'nvim-telescope/telescope-ui-select.nvim' },
        },

        opts = {
            pickers = {
                find_files = {
                    hidden = true
                },
            },
        },

        config = function()
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            local builtin = require('telescope.builtin')
            map('<leader>ff', builtin.find_files, '[F]uzzy find [F]iles')
            map('<leader>fg', builtin.git_files, '[F]uzzy find [G]it')
            map('<leader>fs', builtin.grep_string, '[F]uzzy find [S]tring')
            map('<leader>fl', builtin.live_grep, '[F]uzzy find [L]ive grep')
            map('<leader>fd', builtin.diagnostics, '[F]uzzy find [D]iagnostics')
        end,
    },

    -- {
    --     'neovim/nvim-lspconfig',
    --     dependencies = {
    --         'williamboman/mason.nvim',
    --         'williamboman/mason-lspconfig.nvim',
    --         'WhoIsSethDaniel/mason-tool-installer.nvim',
    --         { 'j-hui/fidget.nvim', opts = {} },
    --     },
    --
    --     config = function()
    --     end,
    -- },

    {
        'stevearc/oil.nvim',
        opts = {},
    },

    { 
        'numToStr/Comment.nvim',
        opts = {},
    },
}
