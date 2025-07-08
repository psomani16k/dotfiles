return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup({
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = 'Comment',
          prefix = '//',
          enabled = true,
        },
        lsp = {
          color = {
            enabled = true,
            background = true,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            enableSnippets = true,
          },
        },
      })
    end,
  },
  {
    'wa11breaker/flutter-bloc.nvim',
    dependencies = {
      "nvimtools/none-ls.nvim", -- Required for code actions
    },
    opts = {
      bloc_type = 'default', -- Choose from: 'default', 'equatable', 'freezed'
      use_sealed_classes = false,
      enable_code_actions = true,
    }
  }
}
