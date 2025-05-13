return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    explorer = { enabled = false },
    dashboard = { enabled = false },
    scroll = { enabled = false },
    picker = {
      prompt = " ",
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<Tab>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        preview = {
          keys = {
            ["<Tab>"] = { "focus_list", mode = { "i", "n" } },
          },
        },
      },
      exclude = {
        "bin",
      },
      files = {
        exclude = {
          "bin",
        },
      },
    },
  },
}
