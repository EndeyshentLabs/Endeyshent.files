return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Show file tree" },
        },
        opts = {},
    },
    {
        "folke/trouble.nvim",
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics (trouble)" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find text (line grep)" },
            { "<leader>fh", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
            { "<leader><space>", "<cmd>Telescope git_files<CR>", desc = "Find git files" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
            { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
        },
    },
}
