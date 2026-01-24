-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete without yanking
vim.keymap.set("v", "D", '"_d', { desc = "Delete line without yanking (visual mode)" })
vim.keymap.set({ "n", "v" }, "DD", '"_dd', { desc = "Delete line without yanking" })
vim.keymap.set({ "n", "v" }, "Dw", '"_dw', { desc = "Delete word without yanking" })
vim.keymap.set({ "n", "v" }, "De", '"_de', { desc = "Delete to end of word without yanking" })
vim.keymap.set({ "n", "v" }, "Db", '"_db', { desc = "Delete to beginning of word without yanking" })
vim.keymap.set({ "n", "v" }, "D0", '"_d0', { desc = "Delete to beginning of line without yanking" })
vim.keymap.set({ "n", "v" }, "D$", '"_dd', { desc = "Delete to end of line without yanking" })

-- Paste without yanking
vim.keymap.set("v", "p", '"_dP', {desc = "Paste (without yanking deleted text)"})
