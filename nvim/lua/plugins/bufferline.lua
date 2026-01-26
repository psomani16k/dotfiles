return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/kyoto-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Shows open files as tabs
        separator_style = "thin", -- Clean VS Code look
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        
        -- This makes the tabs look much better with a file tree (like nvim-tree or neo-tree)
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },
        
        -- Diagnostic indicators (looks like VS Code errors/warnings in tabs)
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return "(" .. count .. ")"
        end,
      }
    })
  end
}
