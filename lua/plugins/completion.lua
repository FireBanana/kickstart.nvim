-- [[ Autocompletion: blink.cmp + LuaSnip ]]

require('luasnip').setup {}

require('blink.cmp').setup {
  keymap = {
    -- 'default' for mappings similar to built-in completions (<c-y> to accept)
    -- 'super-tab' for tab to accept
    -- 'enter' for enter to accept
    -- See `:h blink-cmp-config-keymap` for defining your own
    preset = 'enter',
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    nerd_font_variant = 'mono',
  },

  completion = {
    -- `<c-space>` shows the documentation; auto_show displays it after a delay
    documentation = { auto_show = true, auto_show_delay_ms = 1000 },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },

  snippets = { preset = 'luasnip' },

  -- Use the Lua fuzzy matcher instead of downloading the prebuilt Rust binary
  fuzzy = { implementation = 'lua' },

  -- Show a signature help window while typing function arguments
  signature = { enabled = true },
}
