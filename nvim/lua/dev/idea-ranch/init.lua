local Terminal = require('toggleterm.terminal').Terminal
M = {}

function M.setup(opts)
    if opts.path == nil then
        error("You must specify a path")
    else
        M.path = opts.path
    end
end

M.ranch = Terminal:new({
    cmd = "vim " .. M.path .. M,
    dir = opts.path,
    direction = "float",
    close_on_exit = true,

    on_open = function(term)
        vim.cmd("startinsert!")
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function M.catch(input)
end

return M
