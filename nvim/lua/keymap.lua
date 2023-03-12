local keyset = vim.keymap.set

local opts = { silent = true, noremap = true }

local function xtnd(...)
    return vim.tbl_deep_extend('force', ...)
end

-- Vim Keymaps

-- add semicolon to end of current line
keyset('n', '&', 'mYA;<esc>`Y<cmd>delmarks Y<cr>', { noremap = true })
-- no highlight
keyset('n', '<leader>n', '<cmd>noh<cr>', { noremap = true })
-- source current fille
keyset('n', '<leader><leader>s', '<cmd>%so<cr>', { noremap = true })

-- WhichKey Groups
local wk = require('which-key')

wk.register({ x = "Trouble" }, { prefix = "<leader>"})
wk.register({ m = "Mind" }, { prefix = "<leader>"})
wk.register({ d = "Diagnostics" }, { prefix = "<leader>"})
wk.register({ h = "Harpoon" }, { prefix = "<leader>"})

if not vim.g.vscode then
    -- Telescope
    local builtin = require('telescope.builtin')

    keyset(
        'n',
        '<leader>ff',
        builtin.find_files,
        xtnd(opts, { desc = 'Find Files' })
    )
    keyset(
        'n',
        '<leader>fg',
        builtin.live_grep,
        xtnd(opts, { desc = 'Live Grep' })
    )
    keyset(
        'n',
        '<leader>fb',
        '<cmd>Telescope file_browser<cr>',
        xtnd(opts, { desc = 'File Browser' })
    )
    keyset(
        'n',
        '<leader>fh',
        builtin.help_tags,
        xtnd(opts, { desc = 'Help Tags' })
    )

    -- custom zen command
    function Zen()
        local width = math.floor((vim.o.columns / 3) + 0.5)
        if width < 120 then
            width = 120
        end
        require('zen-mode').toggle({
            window = {
                width = width
            }
        })
    end

    keyset('n', '<leader>z', Zen, xtnd(opts, { desc = 'Zen Mode' }))

    -- Harpoon
    local hp_mark = require('harpoon.mark')
    local hp_ui = require('harpoon.ui')
    keyset('n', '<leader>ha', hp_mark.add_file, xtnd(opts, { desc = "Add File" }))
    keyset('n', '<leader>hm', hp_ui.toggle_quick_menu, xtnd(opts, { desc = "Toggle Quick Menu" }))

    -- Code Action Menu
    keyset('n', '<leader>a', '<cmd>CodeActionMenu<cr>', xtnd(opts, { desc = "Code Action Menu" }))

    -- Trouble
    keyset('n', '<leader>xx', '<cmd>TroubleToggle<cr>', xtnd(opts, { desc = "Trouble" }))
    keyset('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', xtnd(opts, { desc = "Workspace Diagnostics" }))
    keyset('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', xtnd(opts, { desc = "Document Diagnostics" }))
    keyset('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', xtnd(opts, { desc = "Quick Fix" }))
    keyset('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', xtnd(opts, { desc = "Loc List" }))
    keyset('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', xtnd(opts, { desc = "LSP References" }))

    -- Lazygit
    keyset('n', '<leader>g', '<cmd>LazyGit<cr>', xtnd(opts, { desc = "Lazy Git" }))

    -- Mind
    keyset('n', '<leader>mo', '<cmd>MindOpenMain<cr>', xtnd(opts, { desc = "Open Mind" }))
    keyset('n', '<leader>mq', '<cmd>MindClose<cr>', xtnd(opts, { desc = "Open Mind" }))
end

