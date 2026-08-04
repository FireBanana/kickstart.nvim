-- [[ LSP: language servers, mason, diagnostics ]]
-- Servers are configured with the native `vim.lsp.config()` API; nvim-lspconfig
-- provides the default config for each server and mason installs the binaries.

-- Lua LSP for the Neovim config itself (completion for the vim.* API)
require('lazydev').setup {
  library = {
    -- Load luvit types when the `vim.uv` word is found
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

-- LSP status updates
require('fidget').setup {}

require('mason').setup()

-- Language servers to install and enable. The config table of each entry is
-- merged into the nvim-lspconfig defaults; available keys include:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes
--  - capabilities (table): Override fields in capabilities
--  - settings (table): Override the default settings passed when initializing the server
local servers = {
  -- clangd = {},
  -- See `:help lspconfig-all` for all pre-configured servers
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

-- Broadcast blink.cmp's extra completion capabilities to every server
vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
end

-- Installs the servers above and enables them (`:h vim.lsp.enable()`)
require('mason-lspconfig').setup { ensure_installed = vim.tbl_keys(servers) }

-- Non-LSP tools to install; check status with `:Mason`
require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua', -- Used to format Lua code
  },
}

-- Diagnostic config, see `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
  },
}

-- Buffer-local keymaps and behavior, set up whenever an LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local fzf = require 'fzf-lua'

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor (most servers support renaming across files)
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action; usually the cursor needs to be on an error or suggestion
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor
    map('grr', fzf.lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor
    map('gri', fzf.lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to where a variable/function was first declared or defined. To jump back, press <C-t>.
    map('grd', fzf.lsp_definitions, '[G]oto [D]efinition')

    -- WARN: Not Goto Definition; e.g. in C this takes you to the header
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all symbols (variables, functions, types, ...) in the current document
    map('gO', fzf.lsp_document_symbols, 'Open Document Symbols')

    -- Fuzzy find all symbols in the current workspace
    map('gW', fzf.lsp_live_workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the definition of the *type* of the word under your cursor
    map('grt', fzf.lsp_typedefs, '[G]oto [T]ype Definition')

    -- Highlight references of the word under your cursor while it rests there,
    -- cleared again on cursor move. See `:help CursorHold`.
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- Toggle inlay hints, if the server supports them
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})
