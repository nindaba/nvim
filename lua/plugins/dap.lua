return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local widgets = require("dap.ui.widgets")
    local map = vim.keymap

    local virtual_config = {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = false,
      all_references = false,
      filter_references_pattern = "",
      virt_text_pos = "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    }

    require("nvim-dap-virtual-text").setup(virtual_config)

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
      },
    }
    vim.api.nvim_set_hl(0, "red", { fg = "#e74040" })
    vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
    vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    local config = {
      controls = {
        enabled = false,
      },
      floating = {
        border = {
          enabled = false,
        },
      },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.25,
            },
            {
              id = "console",
              size = 0.75,
            },
          },
          position = "right",
          size = 40,
        },
      },
    }

    dapui.setup(config)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      -- dapui.open({})
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close({})
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close({})
    end

    map.set("n", "<leader>de", function(expr)
      dapui.float_element("watches", {
        width = 100,
        height = 20,
        context = "repl",
        enter = true,
        title = "Watches",
        position = "center",
        border = "double",
      })
    end, { desc = "Open evaluation window" })

    map.set("n", "<leader>dl", function(expr)
      dapui.toggle({ layout = 2, reset = true })
    end, { desc = "Open results window" })

    map.set("n", "<leader>du", function()
      dapui.toggle()
    end, { desc = "Toggle dap ui" })

    map.set("n", "<leader>db", function()
      dap.toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })

    map.set("n", "<leader>dj", dap.run_to_cursor, { desc = "󰆿 to cursor" })
    map.set("n", "<F8>", dap.step_over, { desc = " Step over" })
    map.set("n", "<F7>", dap.step_into, { desc = " Step into" })
    map.set("n", "<F6>", dap.step_out, { desc = " Step out" })
    map.set("n", "<F9>", dap.continue, { desc = " Continue" })
    map.set("n", "<Leader>dc", function()
      dap.set_breakpoint(vim.fn.input("Condition: "), nil, nil)
    end, { desc = "Log point" })
    map.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
    map.set({ "n", "v" }, "<Leader>dk", function()
      dapui.eval()
    end, { desc = "Hover variables" })
    map.set({ "n", "v" }, "<Leader>dp", function()
      widgets.preview()
    end, { desc = "Preview variables" })
    map.set("n", "<Leader>df", function()
      local widgets = widgets
      widgets.centered_float(widgets.frames)
    end, { desc = "Frames" })
    map.set("n", "<Leader>ds", function()
      local widgets = widgets
      widgets.centered_float(widgets.scopes)
    end, { desc = "Scopes" })
  end,
}
