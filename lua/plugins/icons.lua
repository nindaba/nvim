return {
  { "echasnovski/mini.icons", enabled = false },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          zsh = {
            icon = "",
            color = "#2f2fd6",
            cterm_color = "65",
            name = "Zsh",
          },
        },
        color_icons = true,
        default = true,
        strict = true,
        variant = "light|dark",
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore",
          },
        },
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log",
          },
          ["properties"] = {
            icon = "",
            color = "#7d8385",
            cterm_color = "66",
            name = "Properties",
          },
          ["graphqls"] = {
            icon = "",
            color = "#e10098",
            name = "GraphQLs",
          },
          ["sh"] = {
            icon = "$",
            color = "#1E5F1E",
            name = "Sh",
          },
        },
        override_by_operating_system = {
          ["apple"] = {
            icon = "",
            color = "#A2AAAD",
            cterm_color = "248",
            name = "Apple",
          },
        },
      })
    end,
  },
}
