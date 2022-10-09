local keyset = vim.keymap.set

local builtin = require('telescope.builtin')
keyset('n', '<leader>ff', builtin.find_files, {})
keyset('n', '<leader>fg', builtin.live_grep, {})
keyset('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', {})
keyset('n', '<leader>fh', builtin.help_tags, {})

-- custom zen command
function Zen ()
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

keyset('n', '<leader>z', Zen)

-- Harpoon
local hp_mark = require('harpoon.mark')
local hp_ui = require('harpoon.ui')
keyset('n', '<leader>ha', hp_mark.add_file, {})
keyset('n', '<leader>hm', hp_ui.toggle_quick_menu, {})

