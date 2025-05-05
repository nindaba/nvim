return {
  "rcarriga/nvim-dap-ui",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local map = vim.keymap

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
              id = "console",
            },
            {
              id = "repl",
              size = 0.25,
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

    map.set("n", "<leader>dc", dap.continue, { desc = "Continue debugger" })
    map.set("n", "<leader>dj", dap.run_to_cursor, { desc = "󰃤 to cursor" })
  end,
}
