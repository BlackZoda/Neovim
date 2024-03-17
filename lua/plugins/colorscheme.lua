return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      color_overrides = {
        mocha = {
          -- this 16 colors are changed to onedark
          base = "#111133",
          mantle = "#222244",
          surface0 = "#3e4451",
          surface1 = "#545862",
          surface2 = "#565c64",
          text = "#abb2bf",
          rosewater = "#b6bdca",
          lavender = "#c8ccd4",
          red = "#e06c75",
          peach = "#d19a66",
          yellow = "#e5c07b",
          green = "#98c379",
          teal = "#56b6c2",
          blue = "#61afef",
          mauve = "#c678dd",
          flamingo = "#be5046",

          -- now patching extra palettes
          maroon = "#e06c75",
          sky = "#d19a66",

          -- extra colors not decided what to do
          pink = "#F5C2E7",
          sapphire = "#74C7EC",

          subtext1 = "#BAC2DE",
          subtext0 = "#A6ADC8",
          overlay2 = "#9399B2",
          overlay1 = "#7F849C",
          overlay0 = "#6C7086",

          crust = "#11111B",
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
