local function map(key, action, desc)
    vim.keymap.set('n', key, action, { desc = desc })
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '  ' }

vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.guicursor = ''

vim.opt.inccommand = 'split'

vim.opt.hlsearch = true
map('<Esc>', function() vim.cmd('nohlsearch') end)

vim.api.nvim_set_option('clipboard', 'unnamedplus')

map('<leader>dn', vim.diagnostic.goto_next, '[D]iagnostics [N]ext')
map('<leader>dp', vim.diagnostic.goto_prev, '[D]iagnostics [P]rev')
map('<leader>de', vim.diagnostic.open_float, '[D]iagnostics [E]rror')
map('<leader>dq', vim.diagnostic.setloclist, '[D]iagnostics [Q]uickfix')

map('<C-h>', '<C-w><C-h>', 'Move to window [H]')
map('<C-j>', '<C-w><C-j>', 'Move to window [J]')
map('<C-k>', '<C-w><C-k>', 'Move to window [K]')
map('<C-l>', '<C-w><C-l>', 'Move to window [L]')

map('<C-d>', '<C-d>zz', 'Go down and center')
map('<C-u>', '<C-u>zz', 'Go up and center')

map('<C-Tab>', '<C-6>', 'Switch between two buffers')

map('<leader>fe', function() vim.cmd('Oil') end, 'Open the file explorer')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight text after yanking',
    callback = function()
        vim.highlight.on_yank()
    end
})

require('config.lazy')
