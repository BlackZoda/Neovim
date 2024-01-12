return {
  { "derektata/lorem.nvim" },
  { "mbbill/undotree" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
}
