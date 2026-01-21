return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    input = {
      enabled = true, -- Explicitly enable the input module
      expand = true,  -- Expand the input window (optional)
    },
    picker = {
      enabled = true,
    }

  }
}
