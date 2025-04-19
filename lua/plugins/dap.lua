return {
  "rcarriga/nvim-dap-ui",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local map = vim.keymap

    dap.configurations.java = {
      {
        outputMode = "remote",
      },
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        outputMode = "remote",
      },
    }

    local config = {
      controls = {
        enabled = false,
      },
      floating = {
        border = {
          enabled = false,
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

    map.set("n", "<leader>dua", function()
      dapui.toggle()
    end, { desc = "Toggle dap ui" })

    map.set("n", "<leader>db", function()
      dap.toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })
  end,
}
