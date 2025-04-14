return {
  { "mfussenegger/nvim-jdtls", dependencies = "hrsh7th/cmp-nvim-lsp" },
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap", -- for the debugger
      "rcarriga/nvim-dap-ui", -- recommended
      "theHamsta/nvim-dap-virtual-text", -- recommended
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "rcasia/neotest-java",
    },
    opts = {
      adapters = {
        ["neotest-java"] = {},
      },
    },
  },
}
-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = "java",
--   },
--   {
--     "mfussenegger/nvim-dap",
--     "nvim-java/nvim-java-dap",
--     optional = true,
--     opts = function()
--       -- Simple configuration to attach to remote java debug process
--       -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
--       local dap = require("dap")
--       --dap.configurations.java = {
--       --  {
--       --  type = "java",
--       --request = "attach",
--       --name = "Debug (Attach) - Remote",
--       --hostName = "127.0.0.1",
--       --port = 5005,
--       --},
--       -- }
--     end,
--     dependencies = {
--       {
--         "williamboman/mason.nvim",
--         opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
--       },
--     },
--     {
--       "elmcgill/springboot-nvim",
--       event = { "BufReadPre", "BufNewFile" },
--       depedencies = {
--         "neovim/nvim-lspconfig",
--         "mfussenegger/nvim-jdtls",
--       },
--       config = function()
--         local springboot_nvim = require("springboot-nvim")
--
--         vim.keymap.set("n", "<leader>cjr", springboot_nvim.boot_run, { desc = "Spring Boot Run Project" })
--         vim.keymap.set("n", "<leader>cjc", springboot_nvim.generate_class, { desc = "Java Create Class" })
--         vim.keymap.set("n", "<leader>cji", springboot_nvim.generate_interface, { desc = "Java Create Interface" })
--         vim.keymap.set("n", "<leader>cje", springboot_nvim.generate_enum, { desc = "Java Create Enum" })
--
--         springboot_nvim.setup()
--       end,
--     },
--   },
--   {
--     "JavaHello/java-deps.nvim",
--     lazy = true,
--     ft = "java",
--     dependencies = "mfussenegger/nvim-jdtls",
--     config = function()
--       require("java-deps").setup({})
--     end,
--   },
-- }
