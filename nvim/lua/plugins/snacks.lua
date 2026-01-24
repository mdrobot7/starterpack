return {
  {
    "folke/snacks.nvim",
    keys = {},
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
      explorer = {
        keys = {
          -- TODO: Make <leader>-e always jump to the explorer, open or not

          -- Remap explorer pg up/down from <C-u>/<C-d> to something more vim-like
          ["<S-Up>"] = { "<C-u>", desc = "Scroll Up" },
          ["<S-Down>"] = { "<C-d>", desc = "Scroll Down" },
          ["<PgUp>"] = { "<C-u>", desc = "Scroll Up" },
          ["<PgDn>"] = { "<C-d>", desc = "Scroll Down" },
        },
      },
    },
  },
}
