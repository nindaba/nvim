return {
  "nvim-neotest/neotest",
  event = "InsertEnter",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rcasia/neotest-java",
  },
  config = function()
    local neotest = require("neotest")
    local map = vim.keymap

    map.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Test Method in debug mode" })

    map.set("n", "<leader>tt", function()
      neotest.run.run()
    end, { desc = "Test Method" })

    map.set("n", "<leader>ta", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Test All" })

    map.set("n", "<leader>to", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle Output window" })

    neotest.setup({
      adapters = {
        require("neotest-java"),
      },
      benchmark = {
        enabled = true,
      },
      consumers = {},
      default_strategy = "integrated",
      diagnostic = {
        enabled = true,
        severity = 1,
      },
      discovery = {
        concurrent = 1,
        enabled = true,
      },
      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.6,
        options = {},
      },
      highlights = {
        adapter_name = "NeotestAdapterName",
        border = "NeotestBorder",
        dir = "NeotestDir",
        expand_marker = "NeotestExpandMarker",
        failed = "NeotestFailed",
        file = "NeotestFile",
        focused = "NeotestFocused",
        indent = "NeotestIndent",
        marked = "NeotestMarked",
        namespace = "NeotestNamespace",
        passed = "NeotestPassed",
        running = "NeotestRunning",
        select_win = "NeotestWinSelect",
        skipped = "NeotestSkipped",
        target = "NeotestTarget",
        test = "NeotestTest",
        unknown = "NeotestUnknown",
        watching = "NeotestWatching",
      },
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        notify = "",
        passed = "",
        running = "",
        running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        skipped = "",
        unknown = "",
        watching = "",
      },
      jump = {
        enabled = true,
      },
      log_level = 3,
      output = {
        enabled = true,
        open_on_run = true,
      },
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      projects = {},
      quickfix = {
        enabled = true,
        open = false,
      },
      run = {
        enabled = true,
      },
      running = {
        concurrent = true,
      },
      state = {
        enabled = true,
      },
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },
      strategies = {
        integrated = {
          height = 40,
          width = 120,
        },
      },
      summary = {
        animated = false,
        count = true,
        enabled = true,
        expand_errors = true,
        follow = true,
        mappings = {
          attach = "a",
          clear_marked = "M",
          clear_target = "T",
          debug = "d",
          debug_marked = "D",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          help = "?",
          jumpto = "i",
          mark = "m",
          next_failed = "J",
          output = "o",
          prev_failed = "K",
          run = "r",
          run_marked = "R",
          short = "O",
          stop = "u",
          target = "t",
          watch = "w",
        },
        open = "botright vsplit | vertical resize 50",
      },
      watch = {
        enabled = false,
        symbol_queries = {
          java = "        ;query\n        ;captures imported classes\n        (import_declaration\n            (scoped_identifier name: ((identifier) @symbol))\n        )\n      ",
          javascript = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
          lua = '        ;query\n        ;Captures module names in require calls\n        (function_call\n          name: ((identifier) @function (#eq? @function "require"))\n          arguments: (arguments (string) @symbol))\n      ',
          python = "        ;query\n        ;Captures imports and modules they're imported from\n        (import_from_statement (_ (identifier) @symbol))\n        (import_statement (_ (identifier) @symbol))\n      ",
          tsx = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
          typescript = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
        },
      },
    })
  end,
}
