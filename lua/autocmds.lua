-- [[ Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text. Try it with `yap` in normal mode.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- In help buffers, make gd jump to the tag under the cursor
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Remap gd to jump tags in help buffers',
  group = vim.api.nvim_create_augroup('help-goto-tag', { clear = true }),
  pattern = 'help',
  callback = function(opts)
    vim.keymap.set('n', 'gd', '<C-]>', { silent = true, buffer = opts.buf })
  end,
})

vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})
