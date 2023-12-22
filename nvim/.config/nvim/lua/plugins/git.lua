return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
        lazy = false,
        keys = {
            { "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
            { "<leader>gbl", "<cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
        },
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
        keys = {
            { "<leader>gf", "<cmd>Git<CR>", desc = "Open git fugitive" },
        },
    },
}
