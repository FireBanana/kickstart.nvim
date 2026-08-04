-- [[ Keymaps ]]
-- See `:help vim.keymap.set()`
-- Plugin-specific keymaps live next to their plugin setup in lua/plugins/

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal (instead of the default <C-\><C-n>)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Cursor movement in insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { silent = true })
vim.keymap.set('i', '<C-j>', '<Down>', { silent = true })
vim.keymap.set('i', '<C-k>', '<Up>', { silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { silent = true })

-- LSP shortcuts
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = '[C]ode [A]ction' })

-- Switch between C/C++ header and source
local function switch_header_source()
  local file = vim.fn.expand '%'
  local extension = vim.fn.expand '%:e'

  if extension == 'h' then
    vim.cmd('e ' .. file:gsub('%.h$', '.cpp'))
  elseif extension == 'hpp' then
    vim.cmd('e ' .. file:gsub('%.hpp$', '.cpp'))
  elseif extension == 'cpp' then
    vim.cmd('e ' .. file:gsub('%.cpp$', '.h'))
  else
    print 'Not a header or source file'
  end
end

vim.keymap.set('n', '<F4>', switch_header_source, { silent = true, desc = 'Switch header/source' })
