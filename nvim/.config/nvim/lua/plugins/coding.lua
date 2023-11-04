return {
  {
    "sheerun/vim-polyglot",
    init = function()
      vim.api.nvim_set_var("polyglot-disabled", { "perl" })
    end,
    config = function()
      vim.filetype.add({
        extension = {
          frag = "glsl",
          vert = "glsl",
          geom = "glsl",
          comp = "glsl",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = { autoformat = false },
  },
  { "echasnovski/mini.align" },
  -- { "tpope/vim-commentary" },
  {
    dir = "~/Coding/Langdev/splic/splic.vim/",
    event = "BufReadPre *.splic",
  },
  {
    dir = "~/Coding/Langdev/EXSES/exses.vim/",
    event = "BufReadPre *.xes",
  },
  {
    dir = "~/software/Intercept/editor/int",
    event = "BufReadPre *.int",
  },
  {
    dir = "~/software/Intercept/editor/int-isel",
    event = "BufReadPre *.isel",
  },
}
