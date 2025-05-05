return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    explorer = { enabled = false },
    dashboard = { enabled = false },
    picker = {
      win = {
        list = {
          keys = {
            ["tt"] = function()
              print("whyej")
            end,
          },
        },
      },
    },
  },
}
