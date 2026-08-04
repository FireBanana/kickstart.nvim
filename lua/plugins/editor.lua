-- [[ Editing helpers: indentation, git signs, todo comments, fuzzy finder, file tree ]]

require('guess-indent').setup {}

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

require('todo-comments').setup { signs = false }

-- Fuzzy finder
local fzf = require 'fzf-lua'
fzf.setup {}

vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Search buffers' })
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', fzf.grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sr', fzf.lsp_references, { desc = '[S]earch [R]eference' })
vim.keymap.set('n', '<leader>sc', fzf.resume, { desc = '[S]earch [C]ontinue' })

-- File tree
vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { reveal = true, toggle = true }
end, { desc = 'File [E]xplorer' })
