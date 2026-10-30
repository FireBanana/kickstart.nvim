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

-- Directories to skip when grepping (applies to grep, live_grep, grep_cword, etc.)
local grep_exclude_dirs = { '.git', '.jj', '.cache', 'build', 'build-*', 'out', 'node_modules', 'tmp', 'temp', '.tmp' }

local grep_excludes, rg_globs = {}, {}
for _, dir in ipairs(grep_exclude_dirs) do
  table.insert(grep_excludes, '--exclude-dir=' .. vim.fn.shellescape(dir))
  table.insert(rg_globs, '--glob=' .. vim.fn.shellescape('!**/' .. dir .. '/'))
end

fzf.setup {
  grep = {
    -- Used when ripgrep is not installed
    grep_opts = '--perl-regexp --binary-files=without-match --line-number --recursive --color=always '
      .. table.concat(grep_excludes, ' ')
      .. ' -e',
    -- Used when ripgrep is installed (it also respects .gitignore)
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 '
      .. table.concat(rg_globs, ' ')
      .. ' -e',
  },
}

vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Search buffers' })
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', fzf.grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sr', fzf.lsp_references, { desc = '[S]earch [R]eference' })
vim.keymap.set('n', '<leader>sc', fzf.resume, { desc = '[S]earch [C]ontinue' })

-- File tree
vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { reveal = true, toggle = true }
end, { desc = 'File [E]xplorer' })
