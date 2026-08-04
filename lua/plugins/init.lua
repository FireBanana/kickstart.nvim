-- [[ Plugins ]]
-- Managed with the built-in package manager, see `:help vim.pack`
--
--  Update plugins with `:lua vim.pack.update()`
--  Remove plugins by deleting them here and running `:lua vim.pack.del(...)`

-- vim.pack has no `build` option, so post-install/update steps run here instead
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-build-hooks', { clear = true }),
  callback = function(ev)
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then
      return
    end
    -- On fresh installs treesitter's own `ensure_installed` downloads the parsers
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      vim.schedule(function()
        vim.cmd 'TSUpdate'
      end)
    elseif ev.data.spec.name == 'LuaSnip' and vim.fn.executable 'make' == 1 then
      -- Needed for regex support in snippets
      vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add {
  -- Libraries used by other plugins
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',

  -- Editor
  'https://github.com/NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  'https://github.com/lewis6991/gitsigns.nvim', -- Git signs in the gutter
  'https://github.com/folke/todo-comments.nvim', -- Highlight TODO, FIXME, etc. in comments
  'https://github.com/ibhagwan/fzf-lua', -- Fuzzy finder
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = 'v3.x' }, -- File tree
  'https://github.com/mhinz/vim-randomtag',

  -- UI
  'https://github.com/folke/which-key.nvim', -- Show pending keybinds
  'https://github.com/echasnovski/mini.nvim', -- Statusline
  'https://github.com/lukas-reineke/indent-blankline.nvim', -- Indent guides
  'https://github.com/Bekaboo/dropbar.nvim', -- Breadcrumbs in the winbar

  -- Treesitter (pinned to master: the `main` branch is a rewrite with a different API)
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },

  -- LSP
  'https://github.com/neovim/nvim-lspconfig', -- Default configs for language servers
  'https://github.com/mason-org/mason.nvim', -- Installer for LSPs and tools
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim', -- LSP status updates
  'https://github.com/folke/lazydev.nvim', -- Lua LSP setup for the Neovim config itself

  -- Completion
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' },

  -- Formatting
  'https://github.com/stevearc/conform.nvim',
}

require 'plugins.editor'
require 'plugins.ui'
require 'plugins.treesitter'
require 'plugins.completion'
require 'plugins.lsp'
require 'plugins.format'
