-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Trim trailing line whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Apply to all files, use a table of patterns for specific filetypes
  callback = function()
    -- Skip for filetypes where trailing spaces might matter (e.g., Markdown)
    if vim.bo.filetype == "markdown" then
      return
    end

    -- Save cursor position
    local save_cursor = vim.fn.getpos(".")
    -- Search and replace trailing whitespaces
    vim.cmd([[%s/\s\+$//e]])
    -- Restore cursor position
    vim.fn.setpos(".", save_cursor)
  end,
  desc = "Trim trailing white space on save",
})

-- Trim trailing newlines
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("RemoveTrailingWhitespace", { clear = true }),
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s#\($\n\s*\)\+\%$##]])
    vim.fn.setpos(".", save_cursor)
  end,
  desc = "Removes trailing whitespace on save",
})

