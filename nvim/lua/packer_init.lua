vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- TODO:
    -- debugging
    -- https://github.com/mfussenegger/nvim-dap
    -- https://github.com/rcarriga/nvim-dap-ui
    -- https://github.com/Pocco81/dap-buddy.nvim
    -- null-ls fmt, code actions, etc https://github.com/jose-elias-alvarez/null-ls.nvim
    -- set up trouble https://github.com/folke/trouble.nvim
    -- bracey looks sick af https://github.com/turbio/bracey.vim
    -- https://github.com/simrat39/symbols-outline.nvim
    -- https://github.com/ray-x/lsp_signature.nvim

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'kyazdani42/nvim-web-devicons'
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Add Additional References
    use 'milisims/nvim-luaref'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'folke/neodev.nvim'
    use 'j-hui/fidget.nvim'
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    -- CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use {
        'hrsh7th/nvim-cmp',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }
    use 'onsails/lspkind.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {
        'ThePrimeagen/harpoon',
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Text Manipulation
    use 'tpope/vim-surround'
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    }
    use {
        "itchyny/vim-cursorword",
        event = { "BufEnter", "BufNewFile" },
        config = function()
            vim.api.nvim_command("augroup user_plugin_cursorword")
            vim.api.nvim_command("autocmd!")
            vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
            vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
            vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
            vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
            vim.api.nvim_command("augroup END")
        end
    }

    -- Misc
    use 'kdheepak/lazygit.nvim'
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup()
        end
    }
    use "karb94/neoscroll.nvim"
    use "metakirby5/codi.vim"
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '<', close = '>' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
    }
end)

-- Misc notes that don't belong in the todo
--
-- READ THIS: https://github.com/nanotee/nvim-lua-guide
-- https://github.com/mattn/vim-gist
-- https://github.com/sindrets/diffview.nvim
