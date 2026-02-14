return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- Set up Mason first
        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")

        -- List of LSP servers to install (use lspconfig server names)
        local servers = {
            "lua_ls",  -- Lua
            "ts_ls",   -- TypeScript/JavaScript
            "pyright", -- Python
            "clangd",  -- C/C++
            "html",    -- HTML
            "cssls",   -- CSS
            -- Add other servers here
        }

        mason_lspconfig.setup({
            ensure_installed = servers,
            automatic_enable = false -- Automatically enable installed servers
        })

        local nvim_lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
                    buffer = bufnr,
                    callback = function() vim.lsp.buf.format() end
                })
            end
        end

        -- Configure each LSP server
        for _, server_name in ipairs(servers) do
            local server_config = {
                capabilities = capabilities,
                on_attach = on_attach
            }

            -- Add server-specific configurations
            if server_name == "lua_ls" then
                server_config.settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } }
                    }
                }
            elseif server_name == "ts_ls" then
                server_config.settings = {
                    typescript = {
                        format = {
                            indentSize = vim.o.shiftwidth,
                            convertTabsToSpaces = vim.o.expandtab,
                            tabSize = vim.o.tabstop,
                        }
                    }
                }
            end

            nvim_lsp[server_name].setup(server_config)
        end
    end
}
