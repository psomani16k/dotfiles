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
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night",
--       styles = {
--         comments = { italic = false },
--         keywords = { italic = false },
--       },
--       transparent = true
--     })
--     vim.cmd("colorscheme tokyonight")
--   end
-- }
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    -- Default options:
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")
  end
}
