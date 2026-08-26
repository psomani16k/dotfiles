local M = {}

local is_zen = false

function M.toggle_zen()
  is_zen = not is_zen

  vim.diagnostic.config({
    virtual_text = not is_zen,
    underline = not is_zen,
    signs = not is_zen,
  })
  require("gitsigns").toggle_signs(not is_zen)

end

return M
