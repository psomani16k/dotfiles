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
			ensure_installed = { "markdown_oxide", "clangd", "lua_ls", "rust_analyzer" },
		}
		require("lspconfig").lua_ls.setup {}
		require("lspconfig").rust_analyzer.setup {}
		require("lspconfig").clangd.setup {}
		require("lspconfig").markdown_oxide.setup {}
	end
}
