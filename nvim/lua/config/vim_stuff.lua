vim.o.compatible = false
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.number = true
vim.o.wildmode = 'longest,list'
vim.o.colorcolumn = '80'
vim.o.cursorline = true
vim.o.spell = true

-- These need cmd because they're ex commands
vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')
vim.cmd('set clipboard+=unnamedplus')
