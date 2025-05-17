return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local group_items = {
      {
        name = "  Tests",
        highlight = { undercurl = false, sp = "green" },
        icon = "",
        priority = 2,
        matcher = function(buf)
          return buf.name:match("Test") or buf.name:match("spec")
        end,
      },
      {
        name = "󱌣 Builds",
        highlight = { sp = "orange" },
        priority = 3,
        matcher = function(buf)
          return buf.path:match("build") or buf.path:match("bin") or buf.path:match("dist")
        end,
      },
      {
        name = "  Main",
        highlight = { sp = "#0266d9" },
        priority = 1,
        matcher = function(buf)
          local isTest = buf.name:match("Test") or buf.name:match("spec")
          local isBuild = buf.path:match("build") or buf.path:match("bin") or buf.path:match("dist")
          return not (isTest or isBuild)
        end,
      },
    }
    require("bufferline").setup({
      options = {
        custom_areas = {
          left = function()
            return {
              { text = "        " },
            }
          end,
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
            if error ~= 0 then
              table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
            end

            if warning ~= 0 then
              table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
            end

            if hint ~= 0 then
              table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
            end

            if info ~= 0 then
              table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
            end
            return result
          end,
        },
        indicator = {
          style = "none",
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
        highlights = {
          background = {
            fg = "#7f7f7f",
            bg = "#1f1f1f",
          },
        },

        groups = {
          options = {
            toggle_hidden_on_enter = false, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          },
          items = group_items,
        },
      },
    })
  end,
}
