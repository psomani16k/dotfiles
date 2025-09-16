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
      ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "gradle_ls", "pbls" },
    }

    -- LSP settings (for overriding per client)
    -- require("lspconfig").lua_ls.setup {}
    -- require("lspconfig").denols.setup {}
    -- require("lspconfig").dartls.setup {}
    -- require("lspconfig").rust_analyzer.setup {}
    -- require("lspconfig").clangd.setup {}
    -- require("lspconfig").markdown_oxide.setup {}
    require('lspconfig').taplo.setup {}
    require("lspconfig").pbls.setup {
      cmd = { "pbls" },
      filetypes = { "proto" },
      root_dir = require('lspconfig.util').root_pattern(".git"),
    }

    local util = require 'lspconfig.util'
    require('lspconfig').gopls.setup {
      root_dir = util.root_pattern('.git'),
      settings = {
        gopls = {
          completeUnimported = true,
        }
      }
    }
  end
}
