-- -- vs code
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

return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      -- Default options
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = true,                -- Disable setting background
          terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,              -- Non focused panes set to alternative background
          module_default = true,             -- Default enable value for modules
          colorblind = {
            enable = false,                  -- Enable colorblind support
            simulate_only = false,           -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,                    -- Severity [0,1] for protan (red)
              deutan = 0,                    -- Severity [0,1] for deutan (green)
              tritan = 0,                    -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {           -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- setup must be called before loading
      vim.cmd("colorscheme terafox")
    end
  }
}
---- tokyonight
--return {
--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    require("tokyonight").setup({
--      style = "night",
--      styles = {
--        comments = { italic = false },
--        keywords = { italic = false },
--      },
--      transparent = true
--    })
--    vim.cmd("colorscheme tokyonight")
--  end
--}

---- gruvbox
-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 100,
--   config = function()
--     -- Default options:
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       -- undercurl = true,
--       -- underline = true,
--       -- bold = true,
--       -- italic = {
--       --   strings = true,
--       --   emphasis = true,
--       --   comments = true,
--       --   operators = false,
--       --   folds = true,
--       -- },
--       -- strikethrough = true,
--       -- invert_selection = false,
--       -- invert_signs = false,
--       -- invert_tabline = false,
--       -- inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "hard", -- can be "hard", "soft" or empty string
--       -- palette_overrides = {},
--       -- overrides = {},
--       -- dim_inactive = true,
--       transparent_mode = true,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end
-- }
