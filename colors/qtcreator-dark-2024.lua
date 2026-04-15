-- qtcreator-dark-2024.lua
-- Neovim colorscheme derived from Qt Creator "Dark (2024)"
-- Colors sourced directly from dark-2024.xml and dark-2024.creatortheme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "qtcreator-dark-2024"
vim.o.termguicolors = true

local hi = vim.api.nvim_set_hl

-- ─── Palette (verbatim from dark-2024.xml) ───────────────────────────────────
local c = {
  -- Editor structure
  bg           = "#1f1f1f",  -- Text.background
  bg_line_nr   = "#262626",  -- LineNumber.background
  bg_current   = "#373737",  -- CurrentLine.background
  bg_selection = "#3f3f3f",  -- Selection.background
  bg_disabled  = "#474747",  -- DisabledCode.background

  fg           = "#d6cf9a",  -- Text.foreground
  fg_line_nr   = "#aeaeae",  -- LineNumber.foreground
  fg_disabled  = "#969696",  -- DisabledCode.foreground
  fg_whitespace= "#4c4d50",  -- VisualWhitespace.foreground

  -- Syntax — directly from xml
  keyword      = "#45c6d6",  -- Keyword / Attribute / QmlStateName
  type         = "#ff8080",  -- Type
  primitive    = "#d69aa7",  -- PrimitiveType
  string       = "#d69545",  -- String
  number       = "#8a602c",  -- Number
  comment      = "#a8abb0",  -- Comment
  comment_doc  = "#65676a",  -- Doxygen.Comment
  comment_tag  = "#66a334",  -- Doxygen.Tag / QmlTypeId / Static / DiffFile
  preprocessor = "#ff6aad",  -- Preprocessor / Binding
  operator     = "#d6bb9a",  -- Operator / Local / Parameter
  global       = "#9aa7d6",  -- Global / QmlExternalId
  label        = "#d6c540",  -- Label / Link / DiffLocation
  local_var    = "#d6bb9a",  -- Local / Parameter
  static_var   = "#66a334",  -- Static
  current_ln   = "#1ec974",  -- CurrentLineNumber

  -- Match parens
  paren_bg     = "#1d545c",  -- Parentheses.background
  paren_fg     = "#bec0c2",  -- Parentheses.foreground
  paren_bad    = "#8f3460",  -- ParenthesesMismatch.background

  -- Search
  search_bg    = "#8a7f2c",  -- SearchResult.background
  search_scope = "#8a602c",  -- SearchScope.background
  occurrence   = "#8a402c",  -- Occurrences.background

  -- Diff
  diff_add_bg  = "#588a2c",  -- DiffDestLine.background
  diff_add_fg  = "#45c6d6",  -- AddedLine.foreground
  diff_del_bg  = "#8a2c40",  -- DiffSourceLine.background
  diff_del_fg  = "#d65645",  -- RemovedLine.foreground

  -- Diagnostics (from underlineColor in xml)
  error        = "#d65645",  -- Error.underlineColor
  warning      = "#d6c545",  -- Warning.underlineColor
  info         = "#b6aef1",  -- Info.underlineColor

  -- Terminal ANSI (from dark-2024.creatortheme)
  t_black      = "#151515",
  t_red        = "#ac4142",
  t_green      = "#7e8e50",
  t_yellow     = "#e5b567",
  t_blue       = "#6c99bb",
  t_magenta    = "#a320ac",
  t_cyan       = "#7dd6cf",
  t_white      = "#d0d0d0",
  t_br_black   = "#505050",
  t_br_red     = "#d05e5b",
  t_br_green   = "#a7b773",
  t_br_yellow  = "#ffd184",
  t_br_blue    = "#94c8ea",
  t_br_magenta = "#f257fb",
  t_br_cyan    = "#a1fcf7",
  t_br_white   = "#ffffff",
}

-- ─── Editor chrome ───────────────────────────────────────────────────────────
hi(0, "Normal",          { fg = c.fg,          bg = c.bg })
hi(0, "NormalFloat",     { fg = c.fg,          bg = "#161616" })
hi(0, "NormalNC",        { fg = c.fg,          bg = c.bg })
hi(0, "ColorColumn",     { bg = c.bg_disabled })
hi(0, "Conceal",         { fg = c.fg_whitespace })
hi(0, "CursorColumn",    { bg = c.bg_current })
hi(0, "CursorLine",      { bg = c.bg_current })
hi(0, "CursorLineNr",    { fg = c.current_ln,  bg = c.bg_line_nr, bold = true })
hi(0, "LineNr",          { fg = c.fg_line_nr,  bg = c.bg_line_nr, bold = true })
hi(0, "SignColumn",      { fg = c.fg_line_nr,  bg = c.bg_line_nr })
hi(0, "FoldColumn",      { fg = c.fg_line_nr,  bg = c.bg_line_nr })
hi(0, "Folded",          { fg = c.comment,     bg = c.bg_line_nr })
hi(0, "VertSplit",       { fg = c.bg_line_nr,  bg = c.bg_line_nr })
hi(0, "WinSeparator",    { fg = c.bg_line_nr,  bg = c.bg_line_nr })
hi(0, "EndOfBuffer",     { fg = c.bg_disabled })
hi(0, "NonText",         { fg = c.bg_disabled })
hi(0, "Whitespace",      { fg = c.fg_whitespace })
hi(0, "SpecialKey",      { fg = c.fg_whitespace })
hi(0, "MatchParen",      { fg = c.paren_fg,    bg = c.paren_bg })

-- ─── Selection & Search ──────────────────────────────────────────────────────
hi(0, "Visual",          { bg = c.bg_selection })
hi(0, "VisualNOS",       { bg = c.bg_selection })
hi(0, "Search",          { bg = c.search_bg })
hi(0, "IncSearch",       { fg = c.bg,          bg = c.label })
hi(0, "CurSearch",       { fg = c.bg,          bg = c.label })
hi(0, "Substitute",      { fg = c.bg,          bg = c.warning })

-- ─── Popup / Float ───────────────────────────────────────────────────────────
hi(0, "Pmenu",           { fg = c.fg,          bg = "#161616" })
hi(0, "PmenuSel",        { fg = c.fg,          bg = c.bg_selection })
hi(0, "PmenuSbar",       { bg = c.bg_disabled })
hi(0, "PmenuThumb",      { bg = c.fg_line_nr })
hi(0, "FloatBorder",     { fg = c.fg_whitespace, bg = "#161616" })
hi(0, "FloatTitle",      { fg = c.keyword,     bg = "#161616" })

-- ─── Status & Tab line ───────────────────────────────────────────────────────
hi(0, "StatusLine",      { fg = c.fg,          bg = "#161616" })
hi(0, "StatusLineNC",    { fg = c.fg_line_nr,  bg = "#161616" })
hi(0, "TabLine",         { fg = c.fg_line_nr,  bg = "#161616" })
hi(0, "TabLineSel",      { fg = c.fg,          bg = c.bg })
hi(0, "TabLineFill",     { bg = "#161616" })
hi(0, "WildMenu",        { fg = c.fg,          bg = c.bg_selection })

-- ─── Messages ────────────────────────────────────────────────────────────────
hi(0, "ModeMsg",         { fg = c.fg,          bold = true })
hi(0, "MsgArea",         { fg = c.fg })
hi(0, "MoreMsg",         { fg = c.keyword })
hi(0, "Question",        { fg = c.global })
hi(0, "Title",           { fg = c.keyword,     bold = true })
hi(0, "ErrorMsg",        { fg = c.error,       bold = true })
hi(0, "WarningMsg",      { fg = c.warning })

-- ─── Diagnostics ─────────────────────────────────────────────────────────────
hi(0, "DiagnosticError",            { fg = c.error })
hi(0, "DiagnosticWarn",             { fg = c.warning })
hi(0, "DiagnosticInfo",             { fg = c.info })
hi(0, "DiagnosticHint",             { fg = c.keyword })
hi(0, "DiagnosticUnderlineError",   { sp = c.error,   underline = true })
hi(0, "DiagnosticUnderlineWarn",    { sp = c.warning, underline = true })
hi(0, "DiagnosticUnderlineInfo",    { sp = c.info,    underdashed = true })
hi(0, "DiagnosticUnderlineHint",    { sp = c.keyword, underdotted = true })
hi(0, "DiagnosticVirtualTextError", { fg = c.error,   italic = true })
hi(0, "DiagnosticVirtualTextWarn",  { fg = c.warning, italic = true })
hi(0, "DiagnosticVirtualTextInfo",  { fg = c.info,    italic = true })
hi(0, "DiagnosticVirtualTextHint",  { fg = c.keyword, italic = true })
hi(0, "DiagnosticSignError",        { fg = c.error })
hi(0, "DiagnosticSignWarn",         { fg = c.warning })
hi(0, "DiagnosticSignInfo",         { fg = c.info })
hi(0, "DiagnosticSignHint",         { fg = c.keyword })

-- ─── Core syntax ─────────────────────────────────────────────────────────────
hi(0, "Comment",         { fg = c.comment,     italic = true })
hi(0, "Constant",        { fg = c.number })
hi(0, "String",          { fg = c.string })
hi(0, "Character",       { fg = c.string })
hi(0, "Number",          { fg = c.number })
hi(0, "Boolean",         { fg = c.keyword,     italic = true })
hi(0, "Float",           { fg = c.number })
hi(0, "Identifier",      { fg = c.local_var })
hi(0, "Function",        { fg = c.fg })        -- Function has no override in xml
hi(0, "Statement",       { fg = c.keyword,     italic = true })
hi(0, "Keyword",         { fg = c.keyword,     italic = true })
hi(0, "Conditional",     { fg = c.keyword,     italic = true })
hi(0, "Repeat",          { fg = c.keyword,     italic = true })
hi(0, "Label",           { fg = c.label })
hi(0, "Operator",        { fg = c.operator })
hi(0, "Exception",       { fg = c.keyword,     italic = true })
hi(0, "PreProc",         { fg = c.preprocessor })
hi(0, "Include",         { fg = c.preprocessor })
hi(0, "Define",          { fg = c.preprocessor })
hi(0, "Macro",           { fg = c.fg })        -- Macro has no override in xml
hi(0, "PreCondit",       { fg = c.preprocessor })
hi(0, "Type",            { fg = c.type })
hi(0, "StorageClass",    { fg = c.keyword,     italic = true })
hi(0, "Structure",       { fg = c.type })
hi(0, "Typedef",         { fg = c.type })
hi(0, "Special",         { fg = c.keyword })
hi(0, "SpecialChar",     { fg = c.string })
hi(0, "Tag",             { fg = c.keyword })
hi(0, "Delimiter",       { fg = c.fg })        -- Punctuation has no override in xml
hi(0, "SpecialComment",  { fg = c.comment_doc, bold = true, italic = true })
hi(0, "Debug",           { fg = c.warning })
hi(0, "Underlined",      { fg = c.label,       underline = true })
hi(0, "Ignore",          { fg = c.fg_whitespace })
hi(0, "Error",           { fg = c.error,       bold = true })
hi(0, "Todo",            { fg = c.comment_tag, bold = true })

-- ─── Treesitter ──────────────────────────────────────────────────────────────
hi(0, "@variable",               { fg = c.local_var })
hi(0, "@variable.builtin",       { fg = c.global })
hi(0, "@variable.parameter",     { fg = c.local_var })
hi(0, "@variable.member",        { fg = c.local_var })

hi(0, "@string",                 { fg = c.string })
hi(0, "@string.escape",          { fg = c.keyword })
hi(0, "@string.special",         { fg = c.keyword })
hi(0, "@character",              { fg = c.string })
hi(0, "@number",                 { fg = c.number })
hi(0, "@number.float",           { fg = c.number })
hi(0, "@boolean",                { fg = c.keyword,     italic = true })

hi(0, "@type",                   { fg = c.type })
hi(0, "@type.builtin",           { fg = c.primitive })
hi(0, "@type.qualifier",         { fg = c.keyword,     italic = true })
hi(0, "@namespace",              { fg = c.type })
hi(0, "@module",                 { fg = c.type })

hi(0, "@function",               { fg = c.fg })
hi(0, "@function.builtin",       { fg = c.fg })
hi(0, "@function.call",          { fg = c.fg })
hi(0, "@function.macro",         { fg = c.fg })
hi(0, "@function.method",        { fg = c.fg })
hi(0, "@function.method.call",   { fg = c.fg })
hi(0, "@constructor",            { fg = c.type })

hi(0, "@keyword",                { fg = c.keyword,     italic = true })
hi(0, "@keyword.operator",       { fg = c.operator })
hi(0, "@keyword.import",         { fg = c.preprocessor })
hi(0, "@keyword.return",         { fg = c.keyword,     italic = true })
hi(0, "@keyword.exception",      { fg = c.keyword,     italic = true })
hi(0, "@keyword.conditional",    { fg = c.keyword,     italic = true })
hi(0, "@keyword.repeat",         { fg = c.keyword,     italic = true })

hi(0, "@comment",                { fg = c.comment,     italic = true })
hi(0, "@comment.documentation",  { fg = c.comment_doc, bold = true, italic = true })

hi(0, "@punctuation.delimiter",  { fg = c.fg })
hi(0, "@punctuation.bracket",    { fg = c.fg })
hi(0, "@operator",               { fg = c.operator })

hi(0, "@constant",               { fg = c.number })
hi(0, "@constant.builtin",       { fg = c.number })
hi(0, "@constant.macro",         { fg = c.fg })

hi(0, "@property",               { fg = c.local_var })
hi(0, "@attribute",              { fg = c.keyword,     italic = true })

hi(0, "@tag",                    { fg = c.keyword })
hi(0, "@tag.attribute",          { fg = c.local_var })
hi(0, "@tag.delimiter",          { fg = c.fg })

hi(0, "@markup.heading",         { fg = c.keyword,     bold = true })
hi(0, "@markup.link",            { fg = c.label,       underline = true })
hi(0, "@markup.raw",             { fg = c.string })
hi(0, "@markup.italic",          { italic = true })
hi(0, "@markup.strong",          { bold = true })

-- ─── LSP semantic tokens ─────────────────────────────────────────────────────
hi(0, "@lsp.type.class",         { fg = c.type })
hi(0, "@lsp.type.comment",       { fg = c.comment,     italic = true })
hi(0, "@lsp.type.decorator",     { fg = c.keyword,     italic = true })
hi(0, "@lsp.type.enum",          { fg = c.type })
hi(0, "@lsp.type.enumMember",    { fg = c.number })
hi(0, "@lsp.type.function",      { fg = c.fg })
hi(0, "@lsp.type.interface",     { fg = c.type })
hi(0, "@lsp.type.keyword",       { fg = c.keyword,     italic = true })
hi(0, "@lsp.type.macro",         { fg = c.fg })
hi(0, "@lsp.type.method",        { fg = c.fg })
hi(0, "@lsp.type.namespace",     { fg = c.type })
hi(0, "@lsp.type.parameter",     { fg = c.local_var })
hi(0, "@lsp.type.property",      { fg = c.local_var })
hi(0, "@lsp.type.string",        { fg = c.string })
hi(0, "@lsp.type.struct",        { fg = c.type })
hi(0, "@lsp.type.type",          { fg = c.type })
hi(0, "@lsp.type.variable",      { fg = c.local_var })
hi(0, "@lsp.mod.deprecated",     { strikethrough = true })
hi(0, "@lsp.mod.static",         { fg = c.static_var,  italic = true })
hi(0, "@lsp.mod.declaration",    { bold = true })

-- ─── Diff ────────────────────────────────────────────────────────────────────
hi(0, "DiffAdd",         { fg = c.diff_add_fg,  bg = c.diff_add_bg })
hi(0, "DiffChange",      { fg = c.global,       bg = "#2a2a3a" })
hi(0, "DiffDelete",      { fg = c.diff_del_fg,  bg = c.diff_del_bg })
hi(0, "DiffText",        { fg = c.fg,           bg = c.bg_selection, bold = true })
hi(0, "Added",           { fg = c.diff_add_fg })
hi(0, "Changed",         { fg = c.global })
hi(0, "Removed",         { fg = c.diff_del_fg })

-- ─── Spell ───────────────────────────────────────────────────────────────────
hi(0, "SpellBad",        { sp = c.error,   undercurl = true })
hi(0, "SpellCap",        { sp = c.warning, undercurl = true })
hi(0, "SpellLocal",      { sp = c.info,    undercurl = true })
hi(0, "SpellRare",       { sp = c.keyword, undercurl = true })

-- ─── Terminal colours ────────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.t_black
vim.g.terminal_color_1  = c.t_red
vim.g.terminal_color_2  = c.t_green
vim.g.terminal_color_3  = c.t_yellow
vim.g.terminal_color_4  = c.t_blue
vim.g.terminal_color_5  = c.t_magenta
vim.g.terminal_color_6  = c.t_cyan
vim.g.terminal_color_7  = c.t_white
vim.g.terminal_color_8  = c.t_br_black
vim.g.terminal_color_9  = c.t_br_red
vim.g.terminal_color_10 = c.t_br_green
vim.g.terminal_color_11 = c.t_br_yellow
vim.g.terminal_color_12 = c.t_br_blue
vim.g.terminal_color_13 = c.t_br_magenta
vim.g.terminal_color_14 = c.t_br_cyan
vim.g.terminal_color_15 = c.t_br_white
