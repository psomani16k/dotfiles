return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    adapters = {
      claude_code = function() -- ← moved up, removed `acp` nesting
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
          },
          commands = {
            default = { "claude-agent-acp" },
            yolo = { "claude-agent-acp", "--yolo" },
          },
        })
      end,
    },
    interactions = {
      chat = {
        keymaps = {
          send = { modes = { n = "<C-s>", i = "<C-s>" } },
          close = { modes = { n = "<C-x>", i = "<C-x>" } },
        },
        adapter = { name = "claude_code" },
      },
      inline = { adapter = { name = "claude_code" } },
      close_on_cancel = false,
      cmd = { adapter = { name = "claude_code" } },
      background = { adapter = { name = "claude_code" } },
    },
  },
}
