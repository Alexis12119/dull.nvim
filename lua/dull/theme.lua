-- local util = require "dull.util"
local colors = require "dull.palette"

local M = {}

function M.setup()
  local config = require "dull.config"
  local options = config.options

  local theme = {
    config = options,
    palette = colors,
  }
  local style = config.options.style
  local transparent = config.options.transparent

  if style == "sunset" then
    theme.palette = vim.tbl_deep_extend("force", {}, colors.colors, colors.sunset)
  elseif style == "night" then
    theme.palette = vim.tbl_deep_extend("force", {}, colors.colors, colors.night)
  elseif style == "slime" then
    theme.palette = vim.tbl_deep_extend("force", {}, colors.colors, colors.slime)
  else
    theme.palette = colors
  end

  local color = theme.palette
  if transparent then
    color.bg = "NONE"
  end

  theme.highlights = {
    MsgArea = { fg = color.fg, bg = color.bg },
    Normal = { fg = color.fg, bg = color.bg },
    NormalNC = { fg = color.fg, bg = color.bg },
    SignColumn = {
      fg = color.fg,
      bg = color.bg,
    },
    SignColumnSB = {
      fg = color.fg,
      bg = color.bg,
    },
    Conceal = { fg = color.dark5 },
    ColorColumn = {
      fg = color.none,
      bg = color.sunset_cursor or color.slime_column or color.night_column or color.cursor_highlight,
    },
    CursorColumn = {
      fg = color.none,
      bg = color.sunset_cursor or color.slime_column or color.night_column or color.cursor_highlight,
    },
    LineNr = {
      fg = color.dark3,
      bg = color.bg,
    },
    CursorLineNr = {
      fg = color.fg_cursorlinenr,
      bg = color.bg,
    },
    Directory = { fg = color.sunset_root or color.slime or color.sky },
    EndOfBuffer = { fg = color.bg },
    Substitute = { fg = color.fg, bg = color.terminal_black },
    FocusedSymbol = { fg = color.blue, bg = color.none },
    Folded = { fg = color.blue, bg = color.fg_gutter },
    FoldColumn = { fg = color.comment, bg = color.none },
    Keyword = { fg = color.cursor_bg },
    ModeMsg = { fg = color.fg_dark, bold = true },
    NonText = { fg = color.fg_dark },
    Question = { fg = color.blue },
    Special = { fg = color.blue },
    SpecialChar = { fg = color.fg },
    SpecialKey = { fg = color.fg },
    CursorLine = {
      bg = color.sunset_cursor or color.slime_cursor or color.night_column or color.cursor_highlight,
    },
    Visual = { bg = color.bg_highlight },
    VisualNOS = { bg = color.bg_highlight },
    Title = { fg = color.blue, bold = true },
    ErrorMsg = { fg = color.red },
    WarningMsg = { fg = color.const_orange },
    Whitespace = { fg = color.fg_gutter },
    WildMenu = { bg = color.bg_dark },
    Identifier = { fg = color.magenta },
    Boolean = { fg = color.yellow },
    Comment = { fg = color.comment },
    Character = { fg = color.green },
    Conditional = { fg = color.purple },
    Constant = { fg = color.const_orange },
    Define = { fg = color.purple },
    Delimiter = { fg = color.fg },
    Exception = { fg = color.yellow },
    Float = { fg = color.blue },
    Function = { fg = color.blue },
    Include = { fg = color.blue },
    Label = { fg = color.blue },
    Macro = { fg = color.const_orange },
    Number = { fg = color.yellow },
    Operator = { fg = color.fg },
    PreProc = { fg = color.cyan },
    PreCondit = { fg = color.cyan },
    Repeat = { fg = color.blue },
    Statement = { fg = color.blue },
    StorageClass = { fg = color.yellow },
    String = { fg = color.green },
    Structure = { fg = color.yellow },
    Tag = { fg = color.blue },
    Todo = { fg = color.dark5, bg = color.bg_highlight },
    Type = { fg = color.yellow },
    Typedef = { fg = color.purple },
    Error = { fg = color.red },

    -- matchparen
    MatchParen = { bold = false, fg = color.yellow },

    -- Lazy
    LazyHandlerTask = { fg = color.green },
    LazyKey = { fg = color.dark5 },

    -- Font
    Bold = { bold = true },
    Italic = { italic = true },
    Underlined = { underline = true, sp = color.dark5 },

    -- Cursor
    TermCursor = { fg = color.bg_dark, bg = color.cursor_bg },
    Cursor = { fg = color.bg, bg = color.fg },
    lCursor = { fg = color.bg, bg = color.fg },
    CursorIM = { fg = color.bg, bg = color.fg },

    -- Separator
    WinSeparator = { fg = color.border or color.light_red or color.slime_border, bg = color.none },

    -- Spell
    SpellBad = { sp = color.red, undercurl = true },
    SpellCap = { sp = color.const_orange, undercurl = true },
    SpellLocal = { sp = color.blue, undercurl = true },
    SpellRare = { sp = color.yellow, undercurl = true },

    --Statusline
    StatusLineNC = { bg = color.bg },
    StatusLine = { fg = color.fg_sidebar, bg = color.dark_red or color.slime_column or color.night },

    -- Float
    NormalFloat = {
      fg = color.fg,
      bg = color.bg,
    },
    FloatBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },

    -- Pmenu
    Pmenu = { fg = "#C0CAF5", bg = color.bg },
    PmenuSel = { bg = "#343A55" },
    PmenuSBar = { bg = "#222229" },
    PmenuThumb = { bg = color.fg_gutter },

    -- Search
    CurSearch = { link = "IncSearch" },
    Search = { fg = color.black, bg = color.blue },
    IncSearch = { fg = color.black, bg = "#87AF87" },

    htmlH1 = { fg = color.magenta, bold = true },
    htmlH2 = { fg = color.blue, bold = true },

    qfLineNr = { link = "CursorLineNr" },
    qfFileName = { fg = color.none },

    -- Diff
    DiffAdd = { fg = color.bg_dark, bg = color.blue },
    DiffChange = { fg = color.bg_dark, bg = color.green },
    DiffDelete = { fg = color.bg_dark, bg = color.red },
    DiffText = { fg = color.bg_dark, bg = color.fg },

    -- Tabline
    TabLine = { bg = color.bg_statusline, fg = color.fg },
    TabLineFill = { bg = color.bg_dark },
    TabLineSel = { fg = color.fg, bg = color.bg },

    -- Bufferline
    -- BufferLineSeparator = {
    --   fg = color.indicator or color.slime or color.sky,
    --   bg = color.sunset_separator or color.slime_separator or color.night_separator,
    -- },
    BufferLineFill = { bg = color.sunset_separator or color.directory or color.night },
    BufferLineIndicatorSelected = {
      fg = color.indicator or color.slime or color.sky,
    },

    -- Trouble
    TroubleText = { fg = color.fg },
    TroubleCount = { fg = color.magenta, bg = color.fg_gutter },
    TroubleNormal = { fg = color.fg_sidebar, bg = color.bg_sidebar },

    -- GitGutter
    GitGutterAdd = {
      fg = color.green,
      bg = color.bg,
    },
    GitGutterChange = {
      fg = color.blue,
      bg = color.bg,
    },
    GitGutterDelete = {
      fg = color.red,
      bg = color.bg,
    },

    mkdCodeDelimiter = { bg = color.terminal_black, fg = color.fg },
    mkdCodeStart = { fg = color.red, bold = true },
    mkdCodeEnd = { fg = color.fg, bold = true },

    markdownHeadingDelimiter = { fg = color.const_orange, bold = true },
    markdownCode = { fg = color.blue },
    markdownCodeBlock = { fg = color.green },
    markdownH1 = { fg = color.fg, bold = true },
    markdownH2 = { fg = color.fg, bold = true },
    markdownH3 = { fg = color.fg, bold = true },
    markdownH4 = { fg = color.fg, bold = true },
    markdownH5 = { fg = color.fg, bold = true },
    markdownH6 = { fg = color.fg, bold = true },
    markdownLinkText = { fg = color.blue, underline = true, sp = color.terminal_black },
    markdownLink = { fg = color.fg, underline = true, sp = color.cursor_fg },
    markdownUrl = { fg = color.fg, underline = true, sp = color.cursor_fg },

    -- Glyph palette
    GlyphPalette1 = { fg = color.red },
    GlyphPalette2 = { fg = color.green },
    GlyphPalette3 = { fg = color.yellow },
    GlyphPalette4 = { fg = color.blue },
    GlyphPalette6 = { fg = color.green1 },
    GlyphPalette7 = { fg = color.fg },
    GlyphPalette9 = { fg = color.red },

    -- Neovim
    healthError = { fg = color.red },
    healthSuccess = { fg = color.green1 },
    healthWarning = { fg = color.const_orange },

    -- Illuminate
    IlluminatedWord = { bg = color.fg_gutter },
    IlluminatedCurWord = { bg = color.fg_gutter },
    IlluminatedWordText = { bg = color.fg_gutter },
    IlluminatedWordRead = { bg = color.fg_gutter },
    IlluminatedWordWrite = { bg = color.fg_gutter },

    -- Treesitter
    ["@annotation"] = { link = "PreProc" },
    ["@preproc"] = { link = "PreProc" },
    ["@debug"] = { fg = color.red },
    ["@variable"] = { fg = color.fg },
    ["@variable.builtin"] = { fg = color.blue },
    ["@none"] = { fg = color.none },
    ["@boolean"] = { fg = color.magenta },
    ["@character"] = { fg = color.green },
    ["@comment"] = { fg = color.comment },
    ["@conceal"] = { fg = color.fg },
    ["@conditional"] = { fg = color.purple },
    ["@constant"] = { fg = color.const_orange },
    ["@constant.builtin"] = { fg = color.const_orange },
    ["@constant.macro"] = { fg = color.const_orange },
    ["@constructor"] = { fg = color.blue },
    ["@exception"] = { fg = color.yellow },
    ["@field"] = { fg = color.green1 },
    ["@float"] = { fg = color.fg },
    ["@function.builtin"] = { fg = color.blue },
    ["@function"] = { fg = color.blue },
    ["@function.macro"] = { fg = color.blue },
    ["@include"] = { fg = color.blue },
    ["@keyword"] = { fg = color.purple },
    ["@keyword.function"] = { fg = color.purple },
    ["@keyword.operator"] = { fg = color.cyan },
    ["@operator"] = { fg = color.fg },
    ["@label"] = { fg = color.magenta },
    ["@method"] = { fg = color.blue },
    ["@method.call"] = { fg = color.blue },
    ["@namespace"] = { fg = color.yellow },
    ["@number"] = { fg = color.yellow },
    ["@parameter"] = { fg = color.fg },
    ["@parameter.reference"] = { fg = color.fg },
    ["@property"] = { fg = color.yellow },
    ["@punctuation"] = { fg = color.dark5 },
    ["@punctuation.delimiter"] = { fg = color.fg },
    ["@punctuation.bracket"] = { fg = color.dark5 },
    ["@punctuation.special"] = { fg = color.blue5 },
    ["@punctuation.special.markdown"] = { fg = color.const_orange, bold = true },
    ["@repeat"] = { fg = color.purple },
    ["@string"] = { fg = color.green },
    ["@string.regex"] = { fg = color.blue6 },
    ["@string.special"] = { fg = color.green },
    ["@string.escape"] = { fg = color.green },
    ["@symbol"] = { fg = color.fg_dark },
    ["@tag"] = { link = "Tag" },
    ["@tag.delimiter"] = { link = "Tag" },
    ["@tag.attribute"] = { fg = color.yellow },
    ["@text"] = { fg = color.fg },
    ["@text.uri"] = { underline = true, sp = color.dark5 },
    ["@text.literal"] = { fg = color.green },
    ["@text.math"] = { fg = color.blue },
    ["@text.environment"] = { fg = color.fg_gutter },
    ["@text.environment.name"] = { fg = color.fg },
    ["@text.reference"] = { fg = color.blue },
    ["@text.title"] = { fg = color.fg },
    ["@text.note"] = { fg = color.bg_dark, bg = color.fg_dark },
    ["@text.warning"] = { fg = color.bg, bg = color.const_orange },
    ["@text.error"] = { fg = color.bg, bg = color.red },
    ["@text.strike"] = { fg = color.fg },
    ["@text.strong"] = { link = "Bold" },
    ["@text.emphasis"] = { link = "Italic" },
    ["@text.underline"] = { link = "Underlined" },
    ["@text.literal.markdown_inline"] = { bg = color.terminal_black, fg = color.blue },
    ["@text.todo"] = { link = "Todo" },
    ["@text.todo.checked"] = { link = "Directory" },
    ["@text.todo.unchecked"] = { link = "PreProc" },
    ["@type"] = { fg = color.yellow },
    ["@type.builtin"] = { fg = color.yellow },
    ["@type.qualifier"] = { link = "Special" },
    ["@type.definition"] = { link = "Typedef" },
    ["@storageclass"] = { link = "StorageClass" },

    TSNodeKey = { fg = color.magenta2, bold = true },
    TSNodeUnmatched = { fg = color.dark3 },

    -- Indent Blankline
    IndentBlanklineContextChar = { fg = color.fg_dark },

    -- HTML
    htmlUnderline = { underline = true, sp = color.dark5 },
    htmlBoldUnderline = { bold = true, underline = true, sp = color.dark5 },
    htmlItalicUnderline = { italic = true, underline = true, sp = color.dark5 },
    htmlUnderlineBold = { bold = true, underline = true, sp = color.dark5 },
    htmlUnderlineBoldItalic = { underline = true, sp = color.dark5 },
    htmlUnderlineItalic = { underline = true, sp = color.dark5 },
    htmlUnderlineItalicBold = { underline = true, sp = color.dark5 },
    htmlItalicUnderlineBold = { italic = true, underline = true, sp = color.dark5 },
    htmlBoldItalicUnderline = { bold = true, italic = true, underline = true, sp = color.dark5 },
    htmlBoldUnderlineItalic = { bold = true, underline = true, sp = color.dark5 },
    htmlItalicBoldUnderline = { italic = true, bold = true, underline = true, sp = color.dark5 },

    -- NvimTree
    NvimTreeGitDeleted = { fg = color.red },
    NvimTreeWinSeparator = {
      fg = color.bg or color.cursor_highlight,
    },
    NvimTreeEndOfBuffer = { link = "EndOfBuffer" },
    NvimTreeSpecialFile = { underline = true, sp = color.fg_cursorlinenr },
    NvimTreeIndentMarker = { fg = color.terminal_black },
    NvimTreeSymlink = { fg = color.yellow },
    NvimTreeNormal = { link = "Normal" },
    NvimTreeNormalNC = { link = "NormalNC" },
    NvimTreeFolderIcon = { fg = color.light_red or color.slime or color.fg_dark },
    NvimTreeRootFolder = { fg = color.sunset_root or color.slime or color.root, bold = false },
    NvimTreeFolderName = { fg = color.fg },
    NvimTreeOpenedFolderName = { fg = color.fg_dark },
    NvimTreeEmptyFolderName = { fg = color.fg_dark },
    NvimTreeGitDirty = { fg = color.blue8 },
    NvimTreeGitNew = { fg = color.green3 },

    -- WhichKey
    WhichKeyBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    WhichKeyFloat = { link = "NormalFloat" },
    WhichKey = { fg = color.blue9 },
    WhichKeyGroup = { fg = color.sunset_root or color.slime or color.sky },
    WhichKeyDesc = { fg = color.magenta },
    WhichKeySeparator = { fg = color.comment },
    WhichKeyValue = { fg = color.dark5 },

    -- Barbar
    -- BufferCurrent = { bg = color.night, fg = color.fg },
    -- BufferCurrentIndex = { bg = color.night, fg = color.blue },
    -- BufferCurrentMod = { bg = color.night, fg = color.yellow },
    -- BufferCurrentSign = { bg = color.night, fg = color.blue },
    -- BufferCurrentTarget = { bg = color.fg_gutter, fg = color.red },
    -- BufferVisible = { bg = color.bg_statusline, fg = color.fg },
    -- BufferVisibleIndex = { bg = color.bg_statusline, fg = color.blue },
    -- BufferVisibleMod = { bg = color.bg_statusline, fg = color.yellow },
    -- BufferVisibleSign = { bg = color.bg_statusline, fg = color.blue },
    -- BufferVisibleTarget = { bg = color.bg_statusline, fg = color.red },
    -- BufferInactive = { bg = color.bg_statusline, fg = color.dark5 },
    -- BufferInactiveIndex = { bg = color.bg_statusline, fg = color.dark5 },
    -- BufferInactiveMod = { bg = color.bg_statusline, fg = color.yellow },
    -- BufferInactiveSign = { bg = color.bg_statusline, fg = color.dark3 },
    -- BufferInactiveTarget = { bg = color.bg_statusline, fg = color.red },
    -- BufferTabpages = { bg = color.bg_statusline, fg = color.none },
    -- BufferTabpage = { bg = color.bg_statusline, fg = color.dark3 },
    -- BufferTabpageFill = { bg = color.night },

    -- Telescope
    TelescopeNormal = { fg = color.fg_cursorlinenr, bg = color.bg },
    TelescopeMatching = { fg = color.sunset_root or color.slime or color.sky, bg = color.bg },
    TelescopeSelection = { fg = color.sunset_root or color.slime or color.sky, bg = color.bg },
    TelescopeMultiSelection = { bg = color.bg },
    TelescopePreviewLine = { bg = color.bg },
    TelescopePromptPrefix = { fg = color.sky or color.light_red or color.slime_border, bg = color.bg },
    TelescopePromptNormal = { fg = color.fg, bg = color.bg },
    -- TelescopePromptBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    -- TelescopePreviewBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    -- TelescopeResultsBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    TelescopeBorder = { fg = color.bg_dark, bg = color.bg },
    -- TelescopePromptTitle = { fg = color.terminal_black, bg = color.none },
    -- TelescopePreviewTitle = { fg = color.terminal_black, bg = color.none },
    -- TelescopeResultsTitle = { fg = color.terminal_black, bg = color.none },
    TelescopeTitle = { fg = color.fg, bg = color.night_column or color.dark_red or color.slime_cursor },

    -- Alpha
    AlphaHeader = { fg = color.light_red or color.slime or color.night_header },
    AlphaButton = { fg = color.fg },
    AlphaFooter = { fg = color.fg },

    -- Dashboard
    DashboardHeader = { fg = color.light_red or color.slime or color.night_header },
    DashboardCenter = { fg = color.fg },
    DashboardFooter = { fg = color.fg },

    -- Git
    GitSignsChange = { fg = color.blue, bg = color.bg },
    GitSignsDelete = { fg = color.red, bg = color.bg },
    GitSignsAdd = { fg = color.green, bg = color.bg },

    -- diff
    diffAdded = { fg = color.green },
    diffRemoved = { fg = color.red },
    diffChanged = { fg = color.blue },
    diffOldFile = { fg = color.yellow },
    diffNewFile = { fg = color.const_orange },
    diffFile = { fg = color.blue },
    diffLine = { fg = color.comment },
    diffIndexLine = { fg = color.magenta },

    -- ts-rainbow
    rainbowcol1 = { fg = color.red },
    rainbowcol2 = { fg = color.yellow },
    rainbowcol3 = { fg = color.green },
    rainbowcol4 = { fg = color.teal },
    rainbowcol5 = { fg = color.blue },
    rainbowcol6 = { fg = color.magenta },
    rainbowcol7 = { fg = color.purple },

    -- LSP
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },
    LspSagaSignatureHelpBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaDefPreviewBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaRenameBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspFloatWinBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaBorderTitle = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaHoverBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaCodeActionBorder = { fg = color.border or color.light_red or color.slime_border, bg = color.none },
    LspSagaFinderSelection = { fg = color.bg_visual },
    LspSagaCodeActionTitle = { fg = color.blue1 },
    LspSagaCodeActionContent = { fg = color.purple },
    ReferencesCount = { fg = color.purple },
    DefinitionCount = { fg = color.purple },
    DefinitionIcon = { fg = color.blue },
    ReferencesIcon = { fg = color.blue },
    TargetWord = { fg = color.cyan },

    LspReferenceText = { bg = color.fg_gutter },
    LspReferenceRead = { bg = color.fg_gutter },
    LspReferenceWrite = { bg = color.fg_gutter },
    LspInfoBorder = { link = "FloatBorder" },
    LspFloatWinNormal = { link = "NormalFloat" },

    DiagnosticError = { fg = color.red },
    DiagnosticInfo = { fg = color.blue },
    DiagnosticWarn = { fg = color.const_orange },
    DiagnosticHint = { fg = color.yellow },

    DiagnosticUnderlineError = { underline = false },
    DiagnosticUnderlineInfo = { underline = false },
    DiagnosticUnderlineWarn = { underline = false },
    DiagnosticUnderlineHint = { underline = false },

    DiagnosticVirtualTextError = { fg = color.red, bg = color.virtual_err },
    DiagnosticVirtualTextInfo = { fg = color.blue, bg = color.virtual_info },
    DiagnosticVirtualTextWarn = { fg = color.const_orange, bg = color.virtual_warn },
    DiagnosticVirtualTextHint = { fg = color.yellow, bg = color.virtual_hint },

    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },

    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignHint = { link = "DiagnosticHint" },

    CmpDocumentationBorder = { fg = color.terminal_black },
    CmpCompletionBorder = { fg = color.terminal_black },
    CmpCursorLine = { bg = color.bg_highlight },

    CmpItemKindFolder = { fg = color.blue },
    CmpItemKindFile = { fg = color.green },

    CmpItemKindEnumMember = { fg = color.purple },
    CmpItemKindFunction = { fg = color.purple },
    CmpItemKindMethod = { fg = color.purple },
    CmpItemKindStruct = { fg = color.purple },
    CmpItemKindEnum = { fg = color.purple },

    CmpItemKindConstructor = { fg = color.yellow },
    CmpItemKindInterface = { fg = color.yellow },
    CmpItemKindReference = { fg = color.yellow },
    CmpItemKindConstant = { fg = color.yellow },
    CmpItemKindProperty = { fg = color.yellow },
    CmpItemKindModule = { fg = color.yellow },
    CmpItemKindClass = { fg = color.yellow },
    CmpItemKindField = { fg = color.yellow },
    CmpItemKindEvent = { fg = color.yellow },

    CmpItemKindTypeParameter = { fg = color.fg_dark },
    CmpItemKindVariable = { fg = color.fg_dark },
    CmpItemKindOperator = { fg = color.blue },
    CmpItemKindSnippet = { fg = color.blue },
    CmpItemKindKeyword = { fg = color.blue },
    CmpItemKindText = { fg = color.fg_dark },
    CmpItemKindUnit = { fg = color.fg_dark },
    CmpItemKindValue = { fg = color.blue },

    CmpItemAbbrMatch = { fg = color.sunset_root or color.slime or color.sky, bg = color.none },
    CmpItemAbbrDeprecated = { fg = color.fg_gutter, bg = color.none, strikethrough = true },
    CmpItemAbbrMatchFuzzy = { fg = color.sunset_root or color.slime or color.sky, bg = color.none },
    CmpItemAbbr = { fg = color.fg, bg = color.none },

    -- Navic
    NavicIconsFile = { fg = color.green, bg = color.none },
    NavicIconsModule = { fg = color.yellow, bg = color.none },
    NavicIconsNamespace = { fg = color.yellow, bg = color.none },
    NavicIconsPackage = { fg = color.fg, bg = color.none },
    NavicIconsClass = { fg = color.const_orange, bg = color.none },
    NavicIconsMethod = { fg = color.blue, bg = color.none },
    NavicIconsProperty = { fg = color.yellow, bg = color.none },
    NavicIconsField = { fg = color.yellow, bg = color.none },
    NavicIconsConstructor = { fg = color.const_orange, bg = color.none },
    NavicIconsEnum = { fg = color.purple, bg = color.none },
    NavicIconsInterface = { fg = color.const_orange, bg = color.none },
    NavicIconsFunction = { fg = color.purple, bg = color.none },
    NavicIconsVariable = { fg = color.blue, bg = color.none },
    NavicIconsConstant = { fg = color.const_orange, bg = color.none },
    NavicIconsString = { fg = color.green, bg = color.none },
    NavicIconsNumber = { fg = color.yellow, bg = color.none },
    NavicIconsBoolean = { fg = color.const_orange, bg = color.none },
    NavicIconsArray = { fg = color.blue, bg = color.none },
    NavicIconsObject = { fg = color.blue, bg = color.none },
    NavicIconsKey = { fg = color.purple, bg = color.none },
    NavicIconsKeyword = { fg = color.cursor_bg, bg = color.none },
    NavicIconsNull = { fg = color.blue, bg = color.none },
    NavicIconsEnumMember = { fg = color.yellow, bg = color.none },
    NavicIconsStruct = { fg = color.purple, bg = color.none },
    NavicIconsEvent = { fg = color.blue, bg = color.none },
    NavicIconsOperator = { fg = color.fg, bg = color.none },
    NavicIconsTypeParameter = { fg = color.fg_dark, bg = color.none },
    NavicText = { fg = color.violet, bg = color.none },
    NavicSeparator = { fg = color.blue8, bg = color.none },

    -- Scrollbar
    ScrollbarHandle = { fg = color.none, bg = color.bg_highlight },

    ScrollbarSearchHandle = { fg = color.const_orange, bg = color.bg_highlight },
    ScrollbarSearch = { fg = color.const_orange, bg = color.none },

    ScrollbarErrorHandle = { fg = color.red, bg = color.bg_highlight },
    ScrollbarError = { fg = color.red, bg = color.none },

    ScrollbarWarnHandle = { fg = color.const_orange, bg = color.bg_highlight },
    ScrollbarWarn = { fg = color.const_orange, bg = color.none },

    ScrollbarInfoHandle = { fg = color.blue, bg = color.bg_highlight },
    ScrollbarInfo = { fg = color.blue, bg = color.none },

    ScrollbarHintHandle = { fg = color.yellow, bg = color.bg_highlight },
    ScrollbarHint = { fg = color.yellow, bg = color.none },

    ScrollbarMiscHandle = { fg = color.purple, bg = color.bg_highlight },
    ScrollbarMisc = { fg = color.purple, bg = color.none },

    -- Yanky
    YankyPut = { link = "Visual" },
    YankyYanked = { link = "Visual" },
    YankHighlight = { bg = color.dark3 },

    -- Notify
    NotifyERRORBorder = { fg = color.red, bg = color.bg },
    NotifyWARNBorder = { fg = color.const_orange, bg = color.bg },
    NotifyINFOBorder = { fg = color.blue, bg = color.bg },
    NotifyDEBUGBorder = { fg = color.comment, bg = color.bg },
    NotifyTRACEBorder = { fg = color.purple, bg = color.bg },
    --- Icons
    NotifyERRORIcon = { fg = color.red },
    NotifyWARNIcon = { fg = color.const_orange },
    NotifyINFOIcon = { fg = color.blue },
    NotifyDEBUGIcon = { fg = color.comment },
    NotifyTRACEIcon = { fg = color.purple },
    --- Title
    NotifyERRORTitle = { fg = color.red },
    NotifyWARNTitle = { fg = color.const_orange },
    NotifyINFOTitle = { fg = color.blue },
    NotifyDEBUGTitle = { fg = color.comment },
    NotifyTRACETitle = { fg = color.purple },
    --- Body
    NotifyERRORBody = { fg = color.fg, bg = color.bg },
    NotifyWARNBody = { fg = color.fg, bg = color.bg },
    NotifyINFOBody = { fg = color.fg, bg = color.bg },
    NotifyDEBUGBody = { fg = color.fg, bg = color.bg },
    NotifyTRACEBody = { fg = color.fg, bg = color.bg },

    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = color.fg_gutter },
    MiniCursorwordCurrent = { bg = color.fg_gutter },

    MiniIndentscopeSymbol = { fg = color.blue1 },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = color.magenta2, fg = "#ffffff" },

    MiniJump2dSpot = { fg = color.magenta2, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = color.yellow, italic = true },
    MiniStarterHeader = { fg = color.blue },
    MiniStarterInactive = { fg = color.comment },
    MiniStarterItem = { fg = color.fg, bg = color.bg },
    MiniStarterItemBullet = { fg = color.dark3 },
    MiniStarterItemPrefix = { fg = color.const_orange },
    MiniStarterSection = { fg = color.blue1 },
    MiniStarterQuery = { fg = color.blue },

    MiniStatuslineDevinfo = { fg = color.fg_dark, bg = color.bg_highlight },
    MiniStatuslineFileinfo = { fg = color.fg_dark, bg = color.bg_highlight },
    MiniStatuslineFilename = { fg = color.fg_dark, bg = color.fg_gutter },
    MiniStatuslineInactive = { fg = color.blue, bg = color.bg_statusline },
    MiniStatuslineModeCommand = { fg = color.black, bg = color.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = color.black, bg = color.green, bold = true },
    MiniStatuslineModeNormal = { fg = color.black, bg = color.blue, bold = true },
    MiniStatuslineModeOther = { fg = color.black, bg = color.teal, bold = true },
    MiniStatuslineModeReplace = { fg = color.black, bg = color.red, bold = true },
    MiniStatuslineModeVisual = { fg = color.black, bg = color.magenta, bold = true },

    MiniSurround = { bg = color.orange, fg = color.black },

    MiniTablineCurrent = { fg = color.fg, bg = color.fg_gutter },
    MiniTablineFill = { bg = color.black },
    MiniTablineHidden = { fg = color.dark5, bg = color.bg_statusline },
    MiniTablineModifiedCurrent = { fg = color.const_orange, bg = color.fg_gutter },
    MiniTablineModifiedHidden = { bg = color.bg_statusline, fg = color.const_orange },
    MiniTablineModifiedVisible = { fg = color.const_orange, bg = color.bg_statusline },
    MiniTablineTabpagesection = { bg = color.bg_statusline, fg = color.none },
    MiniTablineVisible = { fg = color.fg, bg = color.bg_statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = color.red, bold = true },
    MiniTestPass = { fg = color.green, bold = true },

    MiniTrailspace = { bg = color.red },

    -- Noice
    NoiceCompletionItemKindDefault = { fg = color.fg_dark, bg = color.none },

    NoiceCompletionItemKindKeyword = { fg = color.cyan, bg = color.none },

    NoiceCompletionItemKindVariable = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindConstant = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindReference = { fg = color.magenta, bg = color.none },
    NoiceCompletionItemKindValue = { fg = color.magenta, bg = color.none },

    NoiceCompletionItemKindFunction = { fg = color.blue, bg = color.none },
    NoiceCompletionItemKindMethod = { fg = color.blue, bg = color.none },
    NoiceCompletionItemKindConstructor = { fg = color.blue, bg = color.none },

    NoiceCompletionItemKindClass = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindStruct = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindEvent = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindEnum = { fg = color.orange, bg = color.none },
    NoiceCompletionItemKindUnit = { fg = color.orange, bg = color.none },

    NoiceCompletionItemKindModule = { fg = color.yellow, bg = color.none },

    NoiceCompletionItemKindProperty = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindField = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindTypeParameter = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindEnumMember = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindOperator = { fg = color.green1, bg = color.none },
    NoiceCompletionItemKindSnippet = { fg = color.dark5, bg = color.none },
  }

  theme.terminal_colors = {
    terminal_color_0 = color.black,
    terminal_color_8 = color.terminal_black,
    terminal_color_7 = color.fg_dark,
    terminal_color_15 = color.fg,
    terminal_color_1 = color.red1,
    terminal_color_9 = color.red1,
    terminal_color_2 = color.green,
    terminal_color_10 = color.green,
    terminal_color_3 = color.yellow,
    terminal_color_11 = color.yellow,
    terminal_color_4 = color.blue,
    terminal_color_12 = color.blue,
    terminal_color_5 = color.magenta,
    terminal_color_13 = color.magenta,
    terminal_color_6 = color.cyan,
    terminal_color_14 = color.cyan,
  }
  return theme
end

return M
