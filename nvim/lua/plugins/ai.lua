return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        keymaps = {
          send = {
            modes = { n = "<C-s>", i = "<C-s>" },
          },
          close = {
            modes = { n = "<C-x>", i = "<C-x>" },
          },
        },
        adapter = {
          name = "claude_code",
        },
      },
      inline = {
        adapter = {
          name = "claude_code",
        }
      },
      close_on_cancel = false, -- Do not close the chat buffer when pressing Ctrl+c (e.g., with Ctrl-C)
      cmd = {
        adapter = {
          name = "claude_code",
        }
      },
      background = {
        adapter = {
          name = "claude_code",
        }
      },
    },
  },
}

