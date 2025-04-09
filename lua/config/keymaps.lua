-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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
