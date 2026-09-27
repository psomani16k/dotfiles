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
      ensure_installed = {
        "buildifier",
        "clang-format",
        "clangd",
        "dprint",
        "fish-lsp fish_lsp",
        "gopls",
        "gradle-language-server gradle_ls",
        "html-lsp html",
        "jq",
        "json-lsp jsonls",
        "jsonnet-language-server jsonnet_ls",
        "kdlfmt",
        "lua-language-server lua_ls",
        "lua_ls",
        "markdown-oxide markdown_oxide",
        "marksman",
        "oxfmt",
        "protols",
        "rust-analyzer rust_analyzer",
        "rust_analyzer",
        "starlark-rust starlark_rust",
        "taplo",
        "textlint",
        "tinymist",
        "typescript-language-server ts_ls",
      },
    }
  end
}
