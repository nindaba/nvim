-- map. are automatically loaded on the VeryLazy event
-- Default map. that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional map. here
-- Leader key is set to space
vim.g.mapleader = " "

local map = vim.keymap

map.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
map.set("n", "<leader>nl", ":nohl<CR>", { desc = "Clear search hightlights" })
map.set("n", "\\", ":", { desc = "Toggle command mode" })
map.set("n", "S", ":w<CR>", { desc = "Save buffer" })
map.set("t", "jk", "<C-\\><C-n>", { desc = "Escape insert mode" })
map.set("t", "kj", "<C-\\><C-n>", { desc = "Escape insert mode" })

-- Git
map.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Revert hunk" })

-- Window
map.set("n", "wj", ":res +10<CR>", { desc = "Resize window height down" })
map.set("n", "<leader>j", "<C-W>-10", { desc = "Resize window height down" })
map.set("n", "<leader>k", "<C-W>+10", { desc = "Resize window height up" })
map.set("n", "<leader>h", "<C-W><10", { desc = "Resize window height left" })
map.set("n", "<leader>l", "<C-W>>10", { desc = "Resize window height right" })

--LSP
map.set("n", "gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
map.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map.set("n", "rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
map.set("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
map.set("v", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
map.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
map.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map.set("n", "tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")
