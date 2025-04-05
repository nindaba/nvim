-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Leader key is set to space
vim.g.mapleader = " "

local map = vim.keymap

map.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map.set("n", "<leader>nl", ":nohl<CR>", { desc = "Clear search hightlights" })
map.set("n", "\\", ":", { desc = "Toggle command mode" })
map.set("n", "S", ":w<CR>", { desc = "Save buffer" })

-- Git
map.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Revert hunk" })
