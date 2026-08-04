-- [[ Autoformatting with conform.nvim ]]

local conform = require 'conform'

conform.setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    -- Disable format-on-save for languages without a well standardized coding
    -- style (manual formatting with <leader>ff still works)
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    end

    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    c = { 'clang_format_custom' },
    cpp = { 'clang_format_custom' },
    -- Conform can also run multiple formatters sequentially:
    -- python = { "isort", "black" },
  },
  formatters = {
    -- clang-format that falls back to the .clang-format in this config dir
    -- when the project doesn't have one
    clang_format_custom = {
      command = 'clang-format',
      args = function(ctx)
        local dirname = ctx.dirname or vim.fn.getcwd()

        local local_config = vim.fn.findfile('.clang-format', dirname .. ';')
        local fallback_config
        if vim.fn.has 'win32' == 1 then
          fallback_config = vim.fn.expand '$LOCALAPPDATA/nvim/.clang-format'
        else
          fallback_config = vim.fn.expand '~/.config/nvim/.clang-format'
        end

        if local_config and local_config ~= '' then
          return { '--assume-filename=' .. local_config }
        else
          return { '--assume-filename=' .. fallback_config }
        end
      end,
    },
  },
}

vim.keymap.set('', '<leader>ff', function()
  conform.format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat [F]ile' })

vim.keymap.set('n', '<leader>ft', function()
  if vim.g.disable_autoformat then
    vim.cmd 'FormatEnable'
    vim.notify 'Enabled autoformat globally'
  else
    vim.cmd 'FormatDisable'
    vim.notify 'Disabled autoformat globally'
  end
end, { desc = '[F]ormat [T]oggle' })

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- :FormatDisable! disables autoformat for this buffer only
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
