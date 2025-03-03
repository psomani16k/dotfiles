---- vs code
return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('vscode').setup({
		})
		vim.cmd("colorscheme vscode")
	end
}


---- tokyodark
-- return {
-- 	"tiagovla/tokyodark.nvim",
-- 	opts = {
-- 		-- custom options here
-- 	},
-- 	config = function(_, opts)
-- 		require("tokyodark").setup(opts)     -- calling setup is optional
-- 		vim.cmd [[colorscheme tokyodark]]
-- 	end,
-- }
