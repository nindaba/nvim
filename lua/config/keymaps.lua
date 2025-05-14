-- map. are automatically loaded on the VeryLazy event
-- Default map. that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional map. here
-- Leader key is set to space
vim.g.mapleader = " "

local map = vim.keymap
local wk = require("which-key")
local cmd = function(command)
  return function()
    vim.cmd(command)
  end
end

map.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
map.set("n", "<leader>nl", cmd("nohl"), { desc = "Clear search hightlights" })
map.set("n", "\\", ":", { desc = "Toggle command mode" })
map.set("n", "S", cmd("wa"), { desc = "Save buffer" })
map.set("t", "jk", "<C-\\><C-n>", { desc = "Escape insert mode" })
map.set("t", "kj", "<C-\\><C-n>", { desc = "Escape insert mode" })
map.set("n", "tl", cmd("terminal"), { desc = "Open terminal In new tab", noremap = true })
map.set("t", "tt", "<C-\\><C-n>:hide<CR>", { desc = "Escape insert mode", noremap = true, silent = true })
map.set("n", "tt", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)", noremap = true })
-- Git
map.set("n", "<leader>gr", cmd("Gitsigns reset_hunk"), { desc = "Revert hunk" })

-- Window
map.set("n", "wj", cmd("res +10"), { desc = "Resize window height down" })
map.set("n", "<leader>j", "<C-W>-10", { desc = "Resize window height down" })
map.set("n", "<leader>k", "<C-W>+10", { desc = "Resize window height up" })
map.set("n", "<leader>h", "<C-W><10", { desc = "Resize window height left" })
map.set("n", "<leader>l", "<C-W>>10", { desc = "Resize window height right" })

--LSP
map.set("n", "gd", cmd("lua vim.lsp.buf.definition()"))
map.set("n", "gD", cmd("lua vim.lsp.buf.declaration()"))
map.set("n", "gi", cmd("lua vim.lsp.buf.implementation()"))
map.set("n", "gt", cmd("lua vim.lsp.buf.type_definition()"))
map.set("n", "gr", cmd("lua vim.lsp.buf.references()"))
map.set("n", "gs", cmd("lua vim.lsp.buf.signature_help()"))
map.set("n", "rr", cmd("lua vim.lsp.buf.rename()"))
map.set("n", "gf", cmd("lua vim.lsp.buf.format({async = true})"))
map.set("v", "gf", cmd("lua vim.lsp.buf.format({async = true})"))
map.set("n", "ga", cmd("lua vim.lsp.buf.code_action()"))
map.set("n", "gl", cmd("lua vim.diagnostic.open_float()"))
map.set("n", "gp", cmd("lua vim.diagnostic.goto_prev()"))
map.set("n", "gn", cmd("lua vim.diagnostic.goto_next()"))
map.set("n", "tr", cmd("lua vim.lsp.buf.document_symbol()"))
map.set("i", "<C-Space>", cmd("lua vim.lsp.buf.completion()"))

--Options
map.set("n", "<leader>ol", function()
  local opt = vim.opt

  opt.relativenumber = true
  opt.number = true
  opt.tabstop = 2
  opt.shiftwidth = 2
end, { desc = "Load options" })

wk.add({ "<leader>o", group = "Options", icon = "󰘵" })

--󰼪 AI
