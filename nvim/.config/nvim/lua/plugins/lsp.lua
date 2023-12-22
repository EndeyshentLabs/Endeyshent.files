return {
    {
        "folke/neodev.nvim",
        opts = {
            lspconfig = true,
        },
    },
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
    },
    {
        "folke/aerial.nvim",
        opts = {},
        keys = {
            { "<leader>cs", "<cmd>AerialToggle<CR>", desc = "Aerial symbol browser" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        { desc = "Show hover", buffer = args.buf, remap = false }
                    )
                    vim.keymap.set(
                        "n",
                        "F",
                        vim.lsp.buf.format,
                        { desc = "Format buffer", buffer = args.buf, remap = false }
                    )

                    vim.keymap.set(
                        "n",
                        "gd",
                        vim.lsp.buf.definition,
                        { desc = "Goto definition", buffer = args.buf, remap = false }
                    )
                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        { desc = "Goto declaration", buffer = args.buf, remap = false }
                    )
                    vim.keymap.set(
                        "n",
                        "gI",
                        vim.lsp.buf.implementation,
                        { desc = "Goto implementation", buffer = args.buf, remap = false }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        { desc = "Code action", buffer = args.buf, remap = false }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>cd",
                        vim.diagnostic.open_float,
                        { desc = "Show line diagnostics", buffer = args.buf, remap = false }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>lrn",
                        vim.lsp.buf.rename,
                        { desc = "Rename symbol", buffer = args.buf, remap = false }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>lrr",
                        vim.lsp.buf.references,
                        { desc = "Symbol references", buffer = args.buf, remap = false }
                    )

                    vim.keymap.set(
                        "i",
                        "<C-h>",
                        vim.lsp.buf.signature_help,
                        { desc = "Show signature help", buffer = args.buf, remap = false }
                    )
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("neoconf").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")

            local caps = require("cmp_nvim_lsp").default_capabilities()
            for _, v in pairs(require("mason-lspconfig").get_installed_servers()) do
                lspconfig[v].setup({
                    capabilities = caps,
                })
            end
        end,
    },
}
