# nvim config

Personal Neovim configuration (originally based on kickstart.nvim, since
restructured). Requires Neovim 0.12+ — plugins are managed with the built-in
package manager (`:help vim.pack`) and install themselves on first launch.

## Layout

```
init.lua                    entry point: leader, module loading, colorscheme
lua/options.lua             editor options
lua/keymaps.lua             general keymaps
lua/autocmds.lua            autocommands
lua/plugins/init.lua        plugin list (vim.pack.add) + build hooks
lua/plugins/editor.lua      gitsigns, fzf-lua, neo-tree, todo-comments, guess-indent
lua/plugins/ui.lua          which-key, statusline, indent guides, dropbar
lua/plugins/treesitter.lua  treesitter
lua/plugins/lsp.lua         language servers, mason, diagnostics
lua/plugins/completion.lua  blink.cmp + LuaSnip
lua/plugins/format.lua      conform.nvim (stylua, clang-format)
colors/                     Qt Creator colorschemes
```

## Managing plugins

- Update: `:lua vim.pack.update()`
- Add: append to `vim.pack.add` in `lua/plugins/init.lua`, restart
- Remove: delete the entry, then `:lua vim.pack.del { 'name' }`
