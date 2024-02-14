return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    tag = "v7.0.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                default = "~/org",
              },
              default_workspace = "default",
            },
          },
        },
      })
    end,
  },
  { "nvim-orgmode/orgmode" },
}
