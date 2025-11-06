-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')

-- Defer notifications to avoid glitching dashboard
vim.opt.termguicolors = true

-- Set the font and size
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { toggle = true }
end)

-- Remap help jump tags -----

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'help' },
  callback = function(opts)
    vim.keymap.set('n', 'gd', '<C-]>', { noremap = true, silent = true, buffer = opts.buf })
  end,
})

-- Fullsceen toggle ---------

local fullscreen = false

function ToggleFullscreen()
  if fullscreen then
    vim.cmd 'q'
    fullscreen = false
  else
    vim.cmd 'tab split'
    fullscreen = true
  end
end

-- Keymap to toggle fullscreen with F5
vim.api.nvim_set_keymap('n', '<F5>', ':lua ToggleFullscreen()<CR>', { noremap = true, silent = true })
-----------------------------
-- Map cursor movement
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F4>', [[:lua SwitchHeaderSource()<CR>]], { noremap = true, silent = true })
-- vim.keymap.set('n', 'fr', function()
--   require('telescope.builtin').lsp_references()
-- end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ca', function()
  vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = '[C]ode [A]ction' })

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
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'mhinz/vim-randomtag',
    event = 'VeryLazy',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = { exclude = { filetypes = { 'dashboard' } } },
    event = 'VeryLazy',
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
  -- LazySpec (plugin specification)
  -- return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'everforest'
    end,
  },
  -- `lazy` and `priority` are only needed if this is your primary colorscheme to load it first
  -- }
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader><leader>', function()
        require('fzf-lua').buffers()
      end, { desc = '[S]earch Buffers' })
      vim.keymap.set('n', '<leader>sf', function()
        require('fzf-lua').files()
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', function()
        require('fzf-lua').grep()
      end, { desc = '[S]earch [G]rep' })
      vim.keymap.set('n', '<leader>sr', function()
        require('fzf-lua').lsp_references()
      end, { desc = '[S]earch [R]eference' })
      vim.keymap.set('n', '<leader>sc', function()
        require('fzf-lua').resume()
      end, { desc = '[S]earch [C]ontinue' })

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
    event = 'VeryLazy',
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- load before buffers open
    opts = {
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },
}
