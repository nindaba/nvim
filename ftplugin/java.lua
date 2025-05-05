local bundles = vim.fn.glob("~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar", true, true)
local extra_bundles = vim.fn.glob("~/Documents/self/vscode-java-test/server/**", true)

vim.list_extend(bundles, vim.split(extra_bundles, "\n"))

require("jdtls").start_or_attach({
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")),
  },

  root_dir = vim.fs.root(0, { "settings.gradle", ".git", "pom.xml" }),

  init_options = {
    bundles = bundles,
  },

  capabilities = require("cmp_nvim_lsp").default_capabilities(),

  settings = {
    java = {
      format = {
        insertSpaces = true,
        tabSize = 2,
        shiftwidth = 2,
      },
    },
  },

  on_attach = function()
    local map = vim.keymap

    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()

    map.set("n", "<leader>tt", function()
      vim.cmd(":wa")
      require("jdtls").test_nearest_method()
    end, { desc = "Test method" })

    map.set("n", "<leader>ta", function()
      vim.cmd(":wa")
      require("jdtls").test_class()
    end, { desc = "Test all" })

    vim.opt.shiftwidth = 2
  end,
})
