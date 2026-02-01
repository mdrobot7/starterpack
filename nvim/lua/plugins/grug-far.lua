return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      extraRgArgs = "--no-ignore-vcs",
    })
  end,
}
