-- require('orgmode').setup_ts_grammar()

-- Treesitter stuff
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = { 'org' },
    },
    ignore_install = { 'phpdoc' },
    -- ensure_installed = { 'org' },
    context_commentstring = {
        enable = true
    },
}

-- require('orgmode').setup({
--     org_agenda_files = { '~/orgs/**/*' },
--     org_default_notes_file = '~/orgs/refile.org',
-- })

require('nvim-ts-autotag').setup()
