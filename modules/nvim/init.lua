vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.keymap.set('n', '<leader>fe', function() vim.cmd('Ex') end, { })
