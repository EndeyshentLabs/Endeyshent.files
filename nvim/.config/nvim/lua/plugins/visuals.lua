return {
    {
        "RRethy/nvim-base16",
        lazy = true,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme("base16-pop")
        -- end
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        -- priority = 1000,
        -- config = function ()
        --     vim.cmd.colorscheme("tokyonight")
        -- end
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure()
        end,
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
        },
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
        end,
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                ---@diagnostic disable-next-line: unused-local
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
            },
        },
        version = "*",
        lazy = false,
        keys = {
            { "<leader>bd", "<cmd>bd!<CR>", desc = "Delete current buffer" },
            { "<leader><tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
            { "<leader><S-tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
            { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
            { "<leader>bDo", "<cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
            { "<leader>bDh", "<cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers on the left" },
            { "<leader>bDl", "<cmd>BufferLineCloseRight<CR>", desc = "Delete buffers on the right" },
        },
    },
}
