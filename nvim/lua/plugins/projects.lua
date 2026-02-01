return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true, -- prevent adding projects for git submodules or gits inside gits
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    },
  },
}
