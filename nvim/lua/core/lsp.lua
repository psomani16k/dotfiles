local lsp = vim.lsp
lsp.config["gopls"].settings = {
  completeUnimported = true,                     -- suggest symbols from unimported packages
  usePlaceholders = true,                        -- param placeholders in function snippets
  matcher = "fuzzy",
  experimentalPostfixCompletions = true,         -- .if, .var, .for, .print, etc.
  analyses = {
    unusedparams = true,
  },
}
