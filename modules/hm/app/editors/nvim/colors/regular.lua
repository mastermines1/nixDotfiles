
-- colors/regular.lua
-- carburetor regular (https://github.com/ozwaldorf/carburetor)

local colors = {
  base00 = "#161616", -- background
  base01 = "#0b0b0b",
  base02 = "#262626",
  base03 = "#393939",
  base04 = "#525252",
  base05 = "#f4f4f4", -- foreground
  base06 = "#fed7d9",
  base07 = "#be95ff",
  base08 = "#fa4d56", -- red
  base09 = "#fe832b", -- orange
  base0A = "#fddc69", -- yellow
  base0B = "#42be65", -- green
  base0C = "#3ddbd9", -- cyan
  base0D = "#4589ff", -- blue
  base0E = "#d4bbff", -- purple
  base0F = "#ffb3b8", -- pink
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "regular"

local set_hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core UI
set_hl("Normal",      { fg = colors.base05, bg = colors.base00 })
set_hl("CursorLine",  { bg = colors.base01 })
set_hl("Cursor",      { reverse = true })
set_hl("Visual",      { bg = colors.base02 })
set_hl("LineNr",      { fg = colors.base03 })
set_hl("CursorLineNr",{ fg = colors.base0A, bold = true })
set_hl("SignColumn",  { bg = colors.base00 })
set_hl("StatusLine",  { fg = colors.base05, bg = colors.base02 })
set_hl("StatusLineNC",{ fg = colors.base04, bg = colors.base01 })
set_hl("VertSplit",   { fg = colors.base02 })
set_hl("Pmenu",       { fg = colors.base05, bg = colors.base01 })
set_hl("PmenuSel",    { fg = colors.base01, bg = colors.base0D })
set_hl("Search",      { bg = colors.base02, fg = colors.base0A })
set_hl("IncSearch",   { bg = colors.base0A, fg = colors.base01 })
set_hl("MatchParen",  { fg = colors.base08, bold = true })

-- Syntax
set_hl("Comment",     { fg = colors.base03, italic = true })
set_hl("Constant",    { fg = colors.base09 })
set_hl("String",      { fg = colors.base0B })
set_hl("Character",   { fg = colors.base08 })
set_hl("Number",      { fg = colors.base09 })
set_hl("Boolean",     { fg = colors.base09 })
set_hl("Identifier",  { fg = colors.base08 })
set_hl("Function",    { fg = colors.base0D })
set_hl("Statement",   { fg = colors.base0E })
set_hl("Conditional",{ fg = colors.base0E })
set_hl("Repeat",      { fg = colors.base0A })
set_hl("Keyword",     { fg = colors.base0E })
set_hl("Operator",    { fg = colors.base05 })
set_hl("Type",        { fg = colors.base0A })
set_hl("StorageClass",{ fg = colors.base0E })
set_hl("Structure",   { fg = colors.base0E })
set_hl("Typedef",     { fg = colors.base0E })
set_hl("Special",     { fg = colors.base0C })
set_hl("Underlined",  { underline = true })
set_hl("Todo",        { fg = colors.base0A, bg = colors.base01, bold = true })

-- Treesitter
set_hl("@variable",        { fg = colors.base05 })
set_hl("@variable.builtin",{ fg = colors.base08 })
set_hl("@function",        { fg = colors.base0D })
set_hl("@function.builtin",{ fg = colors.base0C })
set_hl("@keyword",         { fg = colors.base0E })
set_hl("@keyword.return",  { fg = colors.base0E })
set_hl("@conditional",     { fg = colors.base0E })
set_hl("@repeat",          { fg = colors.base0A })
set_hl("@string",          { fg = colors.base0B })
set_hl("@number",          { fg = colors.base09 })
set_hl("@boolean",         { fg = colors.base09 })
set_hl("@type",            { fg = colors.base0A })
set_hl("@type.builtin",    { fg = colors.base0E })

-- LSP
set_hl("DiagnosticError", { fg = colors.base08 })
set_hl("DiagnosticWarn",  { fg = colors.base09 })
set_hl("DiagnosticInfo",  { fg = colors.base0D })
set_hl("DiagnosticHint",  { fg = colors.base0C })
set_hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.base08 })
set_hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.base09 })
set_hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.base0D })
set_hl("DiagnosticUnderlineHint",  { undercurl = true, sp = colors.base0C })

-- Plugins
-- Telescope
set_hl("TelescopeNormal",   { fg = colors.base05, bg = colors.base00 })
set_hl("TelescopeBorder",   { fg = colors.base02, bg = colors.base00 })
set_hl("TelescopePrompt",   { fg = colors.base05, bg = colors.base01 })
set_hl("TelescopeSelection",{ fg = colors.base0D, bg = colors.base02, bold = true })

-- GitSigns
set_hl("GitSignsAdd",    { fg = colors.base0B })
set_hl("GitSignsChange", { fg = colors.base0A })
set_hl("GitSignsDelete", { fg = colors.base08 })
