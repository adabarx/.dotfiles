vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

local group = vim.api.nvim_create_augroup("HelpHelpers", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    command = "if &ft ==# 'help' | wincmd L | endif",
    group = group
})
