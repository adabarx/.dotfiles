-- file to set some basic options
vim.o.ma = true
vim.o.mouse = "a"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoread = true
vim.o.nu = true
vim.o.foldlevelstart = 99
vim.o.scrolloff = 7
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- use y and p with the system clipboard
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.relativenumber = true

vim.api.nvim_exec([[
hi Bang ctermfg=red guifg=red
match Bang /\%>99v.*\%<101v/
]], true)

