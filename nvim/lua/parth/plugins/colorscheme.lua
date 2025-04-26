---- vs code
-- return {
--   "Mofiqul/vscode.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('vscode').setup({
--       transparent = true
--     })
--     vim.cmd("colorscheme vscode")
--   end
-- }

---- tokyonight
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      transparent = true
    })
    vim.cmd("colorscheme tokyonight")
  end
}

