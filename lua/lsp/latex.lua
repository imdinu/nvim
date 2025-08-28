require("lspconfig").texlab.setup({
  settings = {
    texlab = {
      auxDirectory = "build",
      build = { onSave = false },   -- VimTeX handles builds
      chktex = { onOpenAndSave = true, onEdit = false },
      diagnosticsDelay = 5,
    },
  },
})
