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

    fuzzy = {
      implementation = "lua",
      sorts = { "sort_text", "exact", "score" },
    },

    completion = {
      list = {
        selection = {
          preselect = true, -- respect LSP's preselect hint
          auto_insert = false,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
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
} }
