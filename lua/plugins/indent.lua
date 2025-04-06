return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local highlight = {
      "whitespace",
    }
    require("ibl").setup({
      indent = { highlight = highlight, char = "" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = true,
      },

      scope = { enabled = false },
    })
  end,
}
