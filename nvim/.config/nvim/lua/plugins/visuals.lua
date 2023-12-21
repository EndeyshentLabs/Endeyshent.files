return {
    {
        "RRethy/nvim-base16",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("base16-pop")
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {},
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local wk = require("which-key")
            wk.setup()

            wk.register({
                ["<leader>F"] = { vim.lsp.buf.format, "Format" },
                ["<esc>"] = { "<cmd>nohl<CR>", "Clear search highlight" },
                ["<leader>f"] = {
                    name = "+file",
                },
                ["<leader>l"] = {
                    name = "+lsp",
                },
                ["<leader>c"] = {
                    name = "+code",
                },
                ["<leader>b"] = {
                    name = "+buffer",
                },
                ["<leader>g"] = {
                    name = "+git",
                },
            })
        end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}
