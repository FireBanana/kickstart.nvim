-- [[ UI: which-key, statusline, indent guides, breadcrumbs ]]

require('which-key').setup {
  -- Delay between pressing a key and opening which-key (independent of vim.o.timeoutlen)
  delay = 0,
  icons = {
    mappings = vim.g.have_nerd_font,
    -- If you are using a Nerd Font: setting keys to an empty table uses the
    -- default which-key.nvim Nerd Font icons; otherwise use this string table
    keys = vim.g.have_nerd_font and {} or {
      Up = '<Up> ',
      Down = '<Down> ',
      Left = '<Left> ',
      Right = '<Right> ',
      C = '<C-…> ',
      M = '<M-…> ',
      D = '<D-…> ',
      S = '<S-…> ',
      CR = '<CR> ',
      Esc = '<Esc> ',
      ScrollWheelDown = '<ScrollWheelDown> ',
      ScrollWheelUp = '<ScrollWheelUp> ',
      NL = '<NL> ',
      BS = '<BS> ',
      Space = '<Space> ',
      Tab = '<Tab> ',
      F1 = '<F1>',
      F2 = '<F2>',
      F3 = '<F3>',
      F4 = '<F4>',
      F5 = '<F5>',
      F6 = '<F6>',
      F7 = '<F7>',
      F8 = '<F8>',
      F9 = '<F9>',
      F10 = '<F10>',
      F11 = '<F11>',
      F12 = '<F12>',
    },
  },

  -- Document existing key chains
  spec = {
    { '<leader>s', group = '[S]earch' },
    { '<leader>f', group = '[F]ormat' },
    { '<leader>t', group = '[T]oggle' },
  },
}

-- Statusline
local statusline = require 'mini.statusline'
statusline.setup { use_icons = true }

-- Show cursor location as LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end

-- Indent guides
require('ibl').setup {}

-- Breadcrumbs
local dropbar_api = require 'dropbar.api'
vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
