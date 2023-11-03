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
  { "tpope/vim-commentary" },
}
