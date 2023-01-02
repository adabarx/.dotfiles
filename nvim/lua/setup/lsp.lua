require("neodev").setup({})

local lsp_configs = {
    pyright     = {},
    eslint      = {},
    gdscript    = {},
    tailwindcss = {},
    taplo       = {},
    svelte      = {},
    tsserver    = { root_dir = require("lspconfig").util.root_pattern("package.json", "package-lock.json") },
    -- denols      = { root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc") },
    marksman    = {},
    volar       = {},
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    globals = { 'vim', 'client' }
                }
            }
        }
    }
}

for server, lsp_config in pairs(lsp_configs) do
    local config = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0, desc = "Hover Info" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0, desc = "Go To Definition" })
            vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0, desc = "Go To Type Definition" })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0, desc = "Go To Implementation" })
            vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0, desc = "Next Diagnostics" })
            vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0, desc = "Prev Diagnostics" })
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0, desc = "Rename Variable" })
            vim.keymap.set('n', '<leader>l', vim.lsp.buf.format, { buffer = 0, desc = "Format File" })
        end,
    }

    vim.tbl_deep_extend("force", config, lsp_config)

    require('lspconfig')[server].setup(config)
end

--Rust Tools
local rt = require("rust-tools")

rt.setup({
    tools = {
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            },
            auto_focus = true,
        },
    },
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
            vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
            vim.keymap.set('n', '<leader>l', vim.lsp.buf.formatting, { buffer = 0 })

            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

require "fidget".setup {}
