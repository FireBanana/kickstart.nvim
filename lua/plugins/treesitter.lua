-- [[ Treesitter: highlight, edit, and navigate code ]]
-- See `:help nvim-treesitter`

local ts = require 'nvim-treesitter'

-- Installs asynchronously; already-installed parsers are skipped
ts.install { 'bash', 'c', 'cpp', 'cmake', 'qmljs', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }

-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules
local regex_languages = { ruby = true }

-- Languages where Vim's built-in indent (cindent) beats treesitter's experimental one
local keep_indent_languages = { c = true, cpp = true }

local function attach(buf, lang)
  if not vim.api.nvim_buf_is_valid(buf) or not pcall(vim.treesitter.start, buf, lang) then
    return
  end
  if regex_languages[lang] then
    vim.bo[buf].syntax = 'on'
  elseif not keep_indent_languages[lang] then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then
      return
    end
    if vim.treesitter.language.add(lang) then
      attach(ev.buf, lang)
    elseif vim.tbl_contains(ts.get_available(), lang) then
      -- Autoinstall languages that are not installed
      ts.install(lang):await(function()
        attach(ev.buf, lang)
      end)
    end
  end,
})
