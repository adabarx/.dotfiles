require('basic_vim_settings')
require('globals')
require('keymap')

require('packer_init')

require('setup.lsp')
require('setup.cmp')
require('setup.treesitter')

if not vim.g.vscode then
    require('setup.catppuccin')
    require('setup.telescope')
    require('setup.neoscroll')
    require('autocommands')
end

