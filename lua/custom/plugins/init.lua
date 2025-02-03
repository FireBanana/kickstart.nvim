-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')

vim.opt.foldmethod = 'indent'

vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { toggle = true }
end)

vim.api.nvim_set_keymap('n', '<F4>', [[:lua SwitchHeaderSource()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'fr', function()
  require('telescope.builtin').lsp_references()
end, { noremap = true, silent = true })

function SwitchHeaderSource()
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

return {
  -- LazySpec (plugin specification)
  -- return {
  {
    'dasupradyumna/midnight.nvim',
    lazy = false,
    priority = 999,
    config = function()
      vim.cmd.colorscheme 'midnight'
    end,
  },
  -- `lazy` and `priority` are only needed if this is your primary colorscheme to load it first
  -- }
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
      vim.keymap.set('n', '<leader>sb', function()
        require('fzf-lua').buffers()
      end, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sf', function()
        require('fzf-lua').files()
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader><leader>', function()
        require('fzf-lua').oldfiles()
      end, { desc = 'Search Recent' })
      vim.keymap.set('n', '<leader>sg', function()
        require('fzf-lua').grep()
      end, { desc = '[S]earch [G]rep' })
      vim.keymap.set('n', '<leader>sr', function()
        require('fzf-lua').lsp_references()
      end, { desc = '[S]earch [R]eference' })

      -- vim.api.nvim_set_keymap('n', '<leader>sp', [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
      -- vim.api.nvim_set_keymap('n', '<leader>sl', [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
      -- vim.api.nvim_set_keymap('n', '<leader>sg', [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
      -- vim.api.nvim_set_keymap('n', '<F1>', [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
}
