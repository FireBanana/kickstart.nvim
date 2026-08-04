-- Leader must be set before keymaps and plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

require 'options'
require 'keymaps'
require 'autocmds'
require 'plugins'

vim.cmd.colorscheme 'qtcreator-dark-2024'

-- vim: ts=2 sts=2 sw=2 et
