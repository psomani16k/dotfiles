return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup {
      ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "markdown_oxide" , "denols"},
    }

    -- LSP settings (for overriding per client)
    -- require("lspconfig").lua_ls.setup {}
    -- require("lspconfig").denols.setup {}
    -- require("lspconfig").dartls.setup {}
    -- require("lspconfig").rust_analyzer.setup {}
    -- require("lspconfig").clangd.setup {}
    -- require("lspconfig").markdown_oxide.setup {}
    require('lspconfig').taplo.setup {}
  end
}
