vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

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
    use{
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }

    -- Debugging, Linting, and Formatting
    -- use 'mfussenegger/nvim-dap'
    -- use 'rcarriga/nvim-dap-ui'
    -- use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'lewis6991/gitsigns.nvim'

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
    -- use {
    --     'tzachar/cmp-tabnine',
    --     run = './install.sh',
    --     requires = 'hrsh7th/nvim-cmp'
    -- }
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

    -- Indents
    use 'lukas-reineke/indent-blankline.nvim'

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }
    use {
        "romgrk/fzy-lua-native",
        requires = { "nvim-telescope/telescope.nvim" },
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
    -- use "metakirby5/codi.vim"
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
end)


-- Misc notes that don't belong in the todo
--
-- READ THIS: https://github.com/nanotee/nvim-lua-guide
-- https://github.com/mattn/vim-gist
-- https://github.com/sindrets/diffview.nvim
