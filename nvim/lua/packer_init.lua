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
    use 'folke/lua-dev.nvim'

    -- CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
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
    use 'p00f/nvim-ts-rainbow'

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
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup()
        end
    }
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
        end
    }
    use "karb94/neoscroll.nvim"
    use "metakirby5/codi.vim"
    use {
        'krivahtoo/silicon.nvim',
        run = './install.sh build'
    }
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    -- F L E S H   P R I S O N
    use "/Users/meowmeowface/projects/idea-ranch.nvim"
end)

-- Misc notes that don't belong in the todo
--
-- READ THIS: https://github.com/nanotee/nvim-lua-guide
-- https://github.com/mattn/vim-gist
-- https://github.com/sindrets/diffview.nvim

