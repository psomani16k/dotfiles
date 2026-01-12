return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = "gemini",
          model = "gemini-2.5-flash"
        }
      },
      inline = {
        adapter = {
          name = "gemini",
          model = "gemini-2.5-flash"
        }
      },
      cmd = {
        adapter = {
          name = "gemini",
          model = "gemini-2.5-flash"
        }
      },
      background = {
        adapter = {
          name = "gemini",
          model = "gemini-2.5-flash"
        }
      },
    },
  },
}
