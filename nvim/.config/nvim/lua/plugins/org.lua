return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = { "Neorg" },
        keys = {
            { "<leader>N", "<cmd>Neorg<CR>", desc = "Neorg" },
        },
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            default = "~/org",
                        },
                    },
                },
            },
        },
    },
}
