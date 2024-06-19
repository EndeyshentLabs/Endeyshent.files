return {
  {
    "lettertwo/laserwave.nvim",
    lazy = true,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("laserwave")
    -- end
  },
  {
    "RRethy/nvim-base16",
    -- lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("base16-pop")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    -- priority = 1000,
    -- config = function()
    --   require("rose-pine").setup({
    --     variant = "main",
    --   })
    --   vim.cmd[[colorscheme rose-pine]]
    -- end
  }
}
