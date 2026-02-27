return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
            ensure_installed = {
                "black",
                --"debugpy",
                "mypy",
                "ruff",
                "pyright"
            }
        },
        --   config = function()
        --    require("mason").setup()
        --   end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "basedpyright", "ts_ls", "rust_analyzer" }, --  "pyrefly", "ruff"
                auto_install = true,
            })
        end,
        --opts = {
        --},

    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            --require "plugings.configs.lspconfig"
            --require "custom.configs.lspconfig"

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 2,
                    source = "if_many",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            vim.lsp.config("ts_ls", { capabilities = capabilities })
            -- vim.lsp.config("solargraph", { capabilities = capabilities })
            -- vim.lsp.config("html", { capabilities = capabilities })
            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("basedpyright", { capabilities = capabilities })
            vim.lsp.config("rust_analyzer", { capabilities = capabilities })
            --vim.lsp.config("debugpy", { capabilities = capabilities })

            --vim.lsp.config("ruff", {
            --capabilities = capabilities,
            --on_attach = function(client)
            --client.server_capabilities.hoverProvider = false
            --end,
            --})

            vim.lsp.config.basedpyright = {
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true, -- ruff organizes imports
                        -- analysis = { ignore = { '*' } }, -- ruff does linting
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "basic",
                            diagnosticSeverityOverrides = {
                                reportOptionalMemberAccess = false, -- "warning"
                            },
                        },
                    },
                },
            }

            vim.lsp.config.ruff = {
                init_options = {
                    settings = {
                        lint = {
                            enable = false, -- use basedpyright for linting, ruff for formatting
                        }
                    },
                }
            }



            vim.lsp.enable({ "ts_ls", "lua_ls", "basedpyright", "rust_analyzer" }) -- "ruff"
            vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            --vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, {})
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            -- autoformat on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                callback = function(args)
                    vim.lsp.buf.format({
                        async = false,
                        bufnr = args.buf,
                    })
                end,
            })
        end,
    },
}
