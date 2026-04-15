-- qtcreator-dark.lua
-- Neovim colorscheme derived from Qt Creator "Contrast Dark (2016)"
-- Generated from dark.creatortheme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "qtcreator-dark"
vim.o.termguicolors = true

local hi = vim.api.nvim_set_hl

-- ─── Palette ────────────────────────────────────────────────────────────────
-- Extracted directly from dark.creatortheme [Palette] and [TerminalAnsi*]
local c = {
  -- Backgrounds
  bg_dark      = "#232323",  -- shadowBackground
  bg           = "#333333",  -- normalBackground
  bg_alt       = "#515151",  -- alternateBackground
  bg_disabled  = "#444444",  -- backgroundColorDisabled
  bg_selected  = "#1f75cc",  -- selectedBackground (stripped alpha)
  bg_details   = "#4a4a4a",  -- DetailsWidgetBackgroundColor

  -- Foregrounds
  fg           = "#e7e7e7",  -- text
  fg_disabled  = "#7f7f7f",  -- textDisabled (50% white)
  fg_mid       = "#a0a0a0",  -- PanelTextColorMid
  fg_placeholder = "#8d8d8d",

  -- Semantic colours
  error        = "#d84044",
  warning      = "#e0b716",
  info         = "#1f75cc",
  link         = "#8ab4f8",
  link_visited = "#c58af9",

  -- Search / highlight
  search_bg    = "#403a14",  -- TextColorHighlightBackground
  search_scroll= "#00c000",  -- TextEditor_SearchResult_ScrollBarColor

  -- VCS
  vcs_added    = "#228b22",
  vcs_modified = "#8ee0ff",
  vcs_deleted  = "#ff6c6c",
  vcs_untracked= "#00ff00",
  vcs_renamed  = "#ffa500",
  vcs_unmerged = "#ff4040",

  -- ANSI terminal colours (used as syntax palette)
  -- Normal
  black        = "#151515",  -- Ansi0
  red          = "#ac4142",  -- Ansi1  – preprocessor / macros
  green        = "#7e8e50",  -- Ansi2  – strings
  yellow       = "#e5b567",  -- Ansi3  – types / constants
  blue         = "#6c99bb",  -- Ansi4  – keywords
  magenta      = "#a320ac",  -- Ansi5  – (spare)
  cyan         = "#7dd6cf",  -- Ansi6  – functions / methods
  white        = "#d0d0d0",  -- Ansi7

  -- Bright
  br_black     = "#505050",  -- Ansi8  – comments / line numbers
  br_red       = "#d05e5b",  -- Ansi9  – errors in code
  br_green     = "#a7b773",  -- Ansi10 – operators / diff add
  br_yellow    = "#ffd184",  -- Ansi11 – numbers / specials
  br_blue      = "#94c8ea",  -- Ansi12 – parameters / fields
  br_magenta   = "#f257fb",  -- Ansi13
  br_cyan      = "#a1fcf7",  -- Ansi14 – built-ins
  br_white     = "#ffffff",  -- Ansi15

  -- Terminal extras
  term_sel     = "#d1d1d1",  -- TerminalSelection (stripped alpha)
  none         = "NONE",
}

-- ─── Editor UI ───────────────────────────────────────────────────────────────
hi(0, "Normal",          { fg = c.fg,          bg = c.bg })
hi(0, "NormalFloat",     { fg = c.fg,          bg = c.bg_dark })
hi(0, "NormalNC",        { fg = c.fg,          bg = c.bg })
hi(0, "ColorColumn",     { bg = c.bg_alt })
hi(0, "Conceal",         { fg = c.br_black })
hi(0, "CursorColumn",    { bg = c.bg_alt })
hi(0, "CursorLine",      { bg = "#2e2e2e" })
hi(0, "CursorLineNr",    { fg = c.fg,          bold = true })
hi(0, "LineNr",          { fg = c.br_black })
hi(0, "SignColumn",      { fg = c.br_black,    bg = c.bg })
hi(0, "FoldColumn",      { fg = c.br_black,    bg = c.bg })
hi(0, "Folded",          { fg = c.fg_mid,      bg = c.bg_alt })
hi(0, "VertSplit",       { fg = c.bg_dark,     bg = c.bg_dark })
hi(0, "WinSeparator",    { fg = c.bg_dark,     bg = c.bg_dark })
hi(0, "EndOfBuffer",     { fg = c.bg_alt })
hi(0, "NonText",         { fg = c.bg_alt })
hi(0, "Whitespace",      { fg = c.bg_alt })
hi(0, "SpecialKey",      { fg = c.br_black })
hi(0, "MatchParen",      { fg = c.br_yellow,   bold = true,  underline = true })

-- ─── Selection & Search ──────────────────────────────────────────────────────
hi(0, "Visual",          { bg = "#1f4060" })
hi(0, "VisualNOS",       { bg = "#1f4060" })
hi(0, "Search",          { fg = c.fg,          bg = c.search_bg })
hi(0, "IncSearch",       { fg = c.black,       bg = c.br_yellow })
hi(0, "CurSearch",       { fg = c.black,       bg = c.br_yellow })
hi(0, "Substitute",      { fg = c.black,       bg = c.warning })

-- ─── Popup / Float ───────────────────────────────────────────────────────────
hi(0, "Pmenu",           { fg = c.fg,          bg = c.bg_dark })
hi(0, "PmenuSel",        { fg = c.fg,          bg = c.bg_selected })
hi(0, "PmenuSbar",       { bg = c.bg_alt })
hi(0, "PmenuThumb",      { bg = c.fg_mid })
hi(0, "FloatBorder",     { fg = c.br_black,    bg = c.bg_dark })
hi(0, "FloatTitle",      { fg = c.blue,        bg = c.bg_dark })

-- ─── Status & Tab line ───────────────────────────────────────────────────────
hi(0, "StatusLine",      { fg = c.fg,          bg = c.bg_dark })
hi(0, "StatusLineNC",    { fg = c.fg_mid,      bg = c.bg_dark })
hi(0, "TabLine",         { fg = c.fg_mid,      bg = c.bg_dark })
hi(0, "TabLineSel",      { fg = c.fg,          bg = c.bg })
hi(0, "TabLineFill",     { bg = c.bg_dark })
hi(0, "WildMenu",        { fg = c.fg,          bg = c.bg_selected })

-- ─── Messages ────────────────────────────────────────────────────────────────
hi(0, "ModeMsg",         { fg = c.fg,          bold = true })
hi(0, "MsgArea",         { fg = c.fg })
hi(0, "MoreMsg",         { fg = c.cyan })
hi(0, "Question",        { fg = c.blue })
hi(0, "Title",           { fg = c.blue,        bold = true })
hi(0, "ErrorMsg",        { fg = c.error,       bold = true })
hi(0, "WarningMsg",      { fg = c.warning })

-- ─── Diagnostics ─────────────────────────────────────────────────────────────
hi(0, "DiagnosticError",            { fg = c.error })
hi(0, "DiagnosticWarn",             { fg = c.warning })
hi(0, "DiagnosticInfo",             { fg = c.info })
hi(0, "DiagnosticHint",             { fg = c.cyan })
hi(0, "DiagnosticUnderlineError",   { sp = c.error,   underline = true })
hi(0, "DiagnosticUnderlineWarn",    { sp = c.warning, underline = true })
hi(0, "DiagnosticUnderlineInfo",    { sp = c.info,    underline = true })
hi(0, "DiagnosticUnderlineHint",    { sp = c.cyan,    underline = true })
hi(0, "DiagnosticVirtualTextError", { fg = c.error,   italic = true })
hi(0, "DiagnosticVirtualTextWarn",  { fg = c.warning, italic = true })
hi(0, "DiagnosticVirtualTextInfo",  { fg = c.info,    italic = true })
hi(0, "DiagnosticVirtualTextHint",  { fg = c.cyan,    italic = true })
hi(0, "DiagnosticSignError",        { fg = c.error })
hi(0, "DiagnosticSignWarn",         { fg = c.warning })
hi(0, "DiagnosticSignInfo",         { fg = c.info })
hi(0, "DiagnosticSignHint",         { fg = c.cyan })

-- ─── Syntax ──────────────────────────────────────────────────────────────────
hi(0, "Comment",         { fg = c.br_black,    italic = true })
hi(0, "Constant",        { fg = c.br_yellow })
hi(0, "String",          { fg = c.green })
hi(0, "Character",       { fg = c.green })
hi(0, "Number",          { fg = c.br_yellow })
hi(0, "Boolean",         { fg = c.blue })
hi(0, "Float",           { fg = c.br_yellow })
hi(0, "Identifier",      { fg = c.fg })
hi(0, "Function",        { fg = c.cyan })
hi(0, "Statement",       { fg = c.blue })
hi(0, "Keyword",         { fg = c.blue })
hi(0, "Conditional",     { fg = c.blue })
hi(0, "Repeat",          { fg = c.blue })
hi(0, "Label",           { fg = c.blue })
hi(0, "Operator",        { fg = c.br_green })
hi(0, "Exception",       { fg = c.blue })
hi(0, "PreProc",         { fg = c.red })
hi(0, "Include",         { fg = c.red })
hi(0, "Define",          { fg = c.red })
hi(0, "Macro",           { fg = c.red })
hi(0, "PreCondit",       { fg = c.red })
hi(0, "Type",            { fg = c.yellow })
hi(0, "StorageClass",    { fg = c.blue })
hi(0, "Structure",       { fg = c.yellow })
hi(0, "Typedef",         { fg = c.yellow })
hi(0, "Special",         { fg = c.br_cyan })
hi(0, "SpecialChar",     { fg = c.br_yellow })
hi(0, "Tag",             { fg = c.cyan })
hi(0, "Delimiter",       { fg = c.fg_mid })
hi(0, "SpecialComment",  { fg = c.br_black,    bold = true })
hi(0, "Debug",           { fg = c.warning })
hi(0, "Underlined",      { underline = true })
hi(0, "Ignore",          { fg = c.br_black })
hi(0, "Error",           { fg = c.error,       bold = true })
hi(0, "Todo",            { fg = c.warning,     bold = true })

-- ─── Treesitter ──────────────────────────────────────────────────────────────
-- Variables
hi(0, "@variable",               { fg = c.fg })
hi(0, "@variable.builtin",       { fg = c.br_cyan })
hi(0, "@variable.parameter",     { fg = c.br_blue })
hi(0, "@variable.member",        { fg = c.br_blue })
-- Literals
hi(0, "@string",                 { fg = c.green })
hi(0, "@string.escape",          { fg = c.br_yellow })
hi(0, "@string.special",         { fg = c.br_yellow })
hi(0, "@number",                 { fg = c.br_yellow })
hi(0, "@number.float",           { fg = c.br_yellow })
hi(0, "@boolean",                { fg = c.blue })
-- Types & namespaces
hi(0, "@type",                   { fg = c.yellow })
hi(0, "@type.builtin",           { fg = c.yellow })
hi(0, "@type.qualifier",         { fg = c.blue })
hi(0, "@namespace",              { fg = c.yellow })
hi(0, "@module",                 { fg = c.yellow })
-- Functions
hi(0, "@function",               { fg = c.cyan })
hi(0, "@function.builtin",       { fg = c.br_cyan })
hi(0, "@function.call",          { fg = c.cyan })
hi(0, "@function.macro",         { fg = c.red })
hi(0, "@function.method",        { fg = c.cyan })
hi(0, "@function.method.call",   { fg = c.cyan })
hi(0, "@constructor",            { fg = c.yellow })
-- Keywords
hi(0, "@keyword",                { fg = c.blue })
hi(0, "@keyword.operator",       { fg = c.br_green })
hi(0, "@keyword.import",         { fg = c.red })
hi(0, "@keyword.return",         { fg = c.blue })
hi(0, "@keyword.exception",      { fg = c.blue })
hi(0, "@keyword.conditional",    { fg = c.blue })
hi(0, "@keyword.repeat",         { fg = c.blue })
-- Misc
hi(0, "@comment",                { fg = c.br_black,  italic = true })
hi(0, "@punctuation.delimiter",  { fg = c.fg_mid })
hi(0, "@punctuation.bracket",    { fg = c.fg_mid })
hi(0, "@operator",               { fg = c.br_green })
hi(0, "@constant",               { fg = c.br_yellow })
hi(0, "@constant.builtin",       { fg = c.br_yellow })
hi(0, "@constant.macro",         { fg = c.red })
hi(0, "@property",               { fg = c.br_blue })
hi(0, "@attribute",              { fg = c.red })
hi(0, "@tag",                    { fg = c.blue })
hi(0, "@tag.attribute",          { fg = c.br_blue })
hi(0, "@tag.delimiter",          { fg = c.fg_mid })
hi(0, "@markup.heading",         { fg = c.blue,      bold = true })
hi(0, "@markup.link",            { fg = c.link,      underline = true })
hi(0, "@markup.raw",             { fg = c.green })

-- ─── LSP semantic tokens ─────────────────────────────────────────────────────
hi(0, "@lsp.type.class",         { fg = c.yellow })
hi(0, "@lsp.type.enum",          { fg = c.yellow })
hi(0, "@lsp.type.enumMember",    { fg = c.br_yellow })
hi(0, "@lsp.type.function",      { fg = c.cyan })
hi(0, "@lsp.type.interface",     { fg = c.yellow })
hi(0, "@lsp.type.keyword",       { fg = c.blue })
hi(0, "@lsp.type.macro",         { fg = c.red })
hi(0, "@lsp.type.method",        { fg = c.cyan })
hi(0, "@lsp.type.namespace",     { fg = c.yellow })
hi(0, "@lsp.type.parameter",     { fg = c.br_blue })
hi(0, "@lsp.type.property",      { fg = c.br_blue })
hi(0, "@lsp.type.string",        { fg = c.green })
hi(0, "@lsp.type.struct",        { fg = c.yellow })
hi(0, "@lsp.type.type",          { fg = c.yellow })
hi(0, "@lsp.type.variable",      { fg = c.fg })
hi(0, "@lsp.mod.deprecated",     { strikethrough = true })

-- ─── Git signs / diff ────────────────────────────────────────────────────────
hi(0, "DiffAdd",         { fg = c.vcs_added,    bg = "#1a2a1a" })
hi(0, "DiffChange",      { fg = c.vcs_modified, bg = "#1a2035" })
hi(0, "DiffDelete",      { fg = c.vcs_deleted,  bg = "#2a1a1a" })
hi(0, "DiffText",        { fg = c.fg,           bg = "#1a2035", bold = true })
hi(0, "Added",           { fg = c.vcs_added })
hi(0, "Changed",         { fg = c.vcs_modified })
hi(0, "Removed",         { fg = c.vcs_deleted })

-- ─── Spell ───────────────────────────────────────────────────────────────────
hi(0, "SpellBad",        { sp = c.error,   undercurl = true })
hi(0, "SpellCap",        { sp = c.warning, undercurl = true })
hi(0, "SpellLocal",      { sp = c.info,    undercurl = true })
hi(0, "SpellRare",       { sp = c.cyan,    undercurl = true })

-- ─── Terminal colours ────────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white
vim.g.terminal_color_8  = c.br_black
vim.g.terminal_color_9  = c.br_red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_magenta
vim.g.terminal_color_14 = c.br_cyan
vim.g.terminal_color_15 = c.br_white
