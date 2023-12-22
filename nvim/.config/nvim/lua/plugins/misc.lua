return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.pairs").setup()
            require("mini.align").setup()
            require("mini.comment").setup()
            require("mini.cursorword").setup()
            require("mini.surround").setup()
            require("mini.move").setup()
        end,
    },
}
