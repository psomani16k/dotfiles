return { {
  'saghen/blink.cmp',
  version = "1.*",
  dependencies = {
    -- 'rafamadriz/friendly-snippets',
  },
  -- use a release tag to download pre-built binaries
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      preset = 'default',
      ['<C-f>'] = { 'accept', 'fallback' },
    },

    appearance = {
      -- use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    fuzzy = { implementation = "prefer_rust" },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,
        window = {
          border = "rounded", -- Noice will override content styling
        },
      },
      menu = {
        border = "rounded",
      }
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        'lsp',
        -- 'lazydev',
        'path',
        -- 'snippets',
        'buffer',
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        lsp = {
          score_offset = 800, -- base LSP preference

          -- Made chatgpt reflect vscodes behaviour here
          kind_scores = {
            ---TOP PRIORITY (context-correct)
            Field         = 2400, --sruct literal fields always win
            Property      = 2200,

            ---HIGH (useful symbols)
            Variable      = 600,
            Constant      = 600,
            TypeParameter = 500,

            ---MEDIUM
            Method        = 400,
            Function      = 350,
            Struct        = 300,
            Interface     = 300,
            TypeAlias     = 300,

            ---LOW / NEUTRAL
            Snippet       = 0,
            Keyword       = -100,
            Operator      = -200,

            ---STRONGLY DISCOURAGED (VS Code hides these unless needed)
            Module        = -6000,
            Package       = -6000,
            Text          = -7000,
            File          = -7000,
            Folder        = -7000,

            ---Effectively hidden
            Reference     = -8000,
            Event         = -8000,
            Color         = -8000,
            Unit          = -8000,
            Value         = -8000,
            Enum          = -8000,
            EnumMember    = -8000,
          }
        },
      },
      per_filetype = {
        codecompanion = { "codecompanion" },
      }
    },

    cmdline = {
      keymap = { preset = 'inherit' },
      completion = { menu = { auto_show = true } },
    },

    -- experimental signature help support
    signature = {
      enabled = true,
      window = {
        border = 'rounded'
      },
    },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}, {
  "saghen/blink.compat",
  lazy = true,
  opts = {},
}, {
  'saghen/blink.pairs',
  version = '*', -- (recommended) only required with prebuilt binaries

  -- download prebuilt binaries from github releases
  dependencies = 'saghen/blink.download',
  -- OR build from source, requires nightly:
  -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  --- @module 'blink.pairs'
  --- @type blink.pairs.Config
  opts = {
    mappings = {
      -- you can call require("blink.pairs.mappings").enable()
      -- and require("blink.pairs.mappings").disable()
      -- to enable/disable mappings at runtime
      enabled = true,
      cmdline = true,
      -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
      -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
      disabled_filetypes = {},
      -- see the defaults:
      -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
      pairs = {},
    },
    highlights = {
      enabled = true,
      -- requires require('vim._extui').enable({}), otherwise has no effect
      cmdline = true,
      groups = {
        'BlinkPairsOrange',
        'BlinkPairsPurple',
        'BlinkPairsBlue',
      },
      unmatched_group = 'BlinkPairsUnmatched',

      -- highlights matching pairs under the cursor
      matchparen = {
        enabled = true,
        -- known issue where typing won't update matchparen highlight, disabled by default
        cmdline = false,
        -- also include pairs not on top of the cursor, but surrounding the cursor
        include_surrounding = false,
        group = 'BlinkPairsMatchParen',
        priority = 250,
      },
    },
    debug = false,
  }
} }
