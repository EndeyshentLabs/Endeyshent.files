return {
  {
    dir = "~/Coding/Langdev/splic/splic.vim/",
    event = "BufReadPre *.splic"
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
  {
    "neovim/nvim-lspconfig",
    opts = { autoformat = false },
  },
}
