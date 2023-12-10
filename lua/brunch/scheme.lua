local palette = require 'brunch.palette'
local utils = require 'brunch.utils'

local M = {}

---@return Scheme
---@param opts Options
function M.create(opts)
  ---@class Scheme
  ---@field highlights Highlights
  local scheme = {
    colors = palette.get(opts),
    options = opts,
  }

  local c = scheme.colors
  local o = scheme.options

  local none = 'NONE'

  local error = c.tomato
  local warning = c.mimosa
  local info = c.cornflower
  local hint = c.aqua

  ---@alias HighlightStyle 'bold' | 'italic' | 'underline' | 'undercurl'

  ---@class Highlight
  ---@field fg string|number|nil
  ---@field bg string|number|nil
  ---@field style HighlightStyle[]|nil
  ---@field link string|nil
  ---@field ctermfg string|number|nil
  ---@field ctermbg string|number|nil

  ---@alias Highlights table<string, Highlight>
  ---@type Highlights
  scheme.highlights = {
    Comment = { fg = c.overlay0, style = o.styles.comments or {} }, -- any comment
    ColorColumn = { bg = c.surface0 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.overlay1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.base, bg = c.text }, -- character under the cursor
    lCursor = { fg = c.base, bg = c.text }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.base, bg = c.text }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.mantle }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.mantle }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
    Directory = { fg = c.blueberry }, -- directory names (and other special names in listings)
    EndOfBuffer = { fg = c.subtext0 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { fg = c.tomato, style = { 'bold', 'italic' } }, -- error messages on the command line
    VertSplit = { fg = c.crust }, -- the column separating vertically split windows
    WinSeparator = { fg = c.crust, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.blueberry, bg = c.surface1 }, -- line used for closed folds
    FoldColumn = { fg = c.overlay0 }, -- 'foldcolumn'

    -- TODO: This doesn't seem to be working.
    SignColumn = { fg = c.surface1 }, -- column where |signs| are displayed
    SignColumnSB = { fg = c.surface1, bg = c.crust }, -- column where |signs| are displayed

    Substitute = {
      fg = utils.vary_color({ sunday = c.tomato }, c.raspberry),
      bg = c.surface1,
    }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.overlay2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.peach }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.peach, bg = c.surface1, style = { 'bold' } }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.text, style = { 'bold' } }, -- 'showmode' message (e.g., "-- INSERT -- ")

    -- TODO: Neovim bug.
    -- MsgArea = { fg = c.text }, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832

    MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blueberry }, -- |more-prompt|
    NonText = { fg = c.overlay0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.text }, -- normal text
    NormalNC = { fg = c.text }, -- normal text in non-current windows
    NormalSB = { fg = c.text, bg = c.crust }, -- normal text in non-current windows
    NormalFloat = { fg = c.text, bg = c.surface0 }, -- Normal text in floating windows.
    FloatBorder = { fg = c.blueberry },
    FloatTitle = { fg = c.subtext0 }, -- Title of floating windows
    Pmenu = { fg = c.subtext1, bg = c.surface1 }, -- Popup menu: normal item.
    PmenuSel = { fg = c.aqua, bg = c.surface0, style = { 'bold' } }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.surface1 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.overlay0 }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blueberry }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.surface1, style = { 'bold' } }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = c.mantle, bg = c.grapefruit }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { fg = c.mantle, bg = c.rosewater }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { fg = c.mantle, bg = c.raspberry }, -- 'cursearch' highlighting: highlights the current search you're on differently
    SpecialKey = { link = 'NonText' }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
    -- TODO: The `guisp` option used in these doesn't work, and the undercurl
    -- usually shows up as an underline.
    SpellBad = { sp = c.tomato, style = { 'undercurl' } }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.mimosa, style = { 'undercurl' } }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.blueberry, style = { 'undercurl' } }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.kale, style = { 'undercurl' } }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- TODO: Check these at some point.
    StatusLine = { fg = c.text, bg = c.mantle }, -- status line of current window
    StatusLineNC = { fg = c.surface1, bg = c.mantle }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.surface1, bg = c.mantle }, -- tab pages line, not active tab page label
    TabLineFill = {}, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.kale, bg = c.surface1 }, -- tab pages line, active tab page label

    Title = { fg = c.blueberry, style = { 'bold' } }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.surface1, style = { 'bold' } }, -- Visual mode selection
    VisualNOS = { bg = c.surface1, style = { 'bold' } }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.mimosa }, -- warning messages
    Whitespace = { fg = c.surface1 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.overlay0 }, -- current match in 'wildmenu' completion
    WinBar = { fg = c.rosewater }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups, but they are de facto
    -- standard group names for syntax highlighting.

    SpecialComment = { link = 'Special' }, -- special things inside a comment
    Constant = { fg = c.peach }, -- (preferred) any constant
    String = { fg = c.kale, style = o.styles.strings or {} }, -- a string constant: 'this is a string'
    Character = { fg = c.aqua }, -- a character constant: 'c', '\n'
    Number = { fg = c.peach, style = o.styles.numbers or {} }, -- a number constant: 234, 0xff
    Float = { link = 'Number' }, -- a floating point constant: 2.3e10
    Boolean = { fg = c.peach, style = o.styles.booleans or {} }, -- a boolean constant: TRUE, false
    Identifier = { fg = c.grapefruit, style = o.styles.variables or {} }, -- (preferred) any variable name
    Function = { fg = c.blueberry, style = o.styles.functions or {} }, -- function name (also: methods for classes)
    Statement = { fg = c.blackberry }, -- (preferred) any statement
    Conditional = { fg = c.blackberry, style = o.styles.conditionals or {} }, -- if, then, else, endif, switch, etc.
    Repeat = { fg = c.blackberry, style = o.styles.loops or {} }, -- for, do, while, etc.
    Label = { fg = c.avocado }, -- case, default, etc.
    Operator = { fg = c.cornflower, style = o.styles.operators or {} }, -- 'sizeof', '+', '*', etc.
    Keyword = { fg = c.blackberry, style = o.styles.keywords or {} }, -- any other keyword
    Exception = { fg = c.blackberry, style = o.styles.keywords or {} }, -- try, catch, throw

    PreProc = { fg = c.raspberry }, -- (preferred) generic Preprocessor
    Include = { fg = c.blackberry, style = o.styles.keywords or {} }, -- preprocessor #include
    Define = { link = 'PreProc' }, -- preprocessor #define
    Macro = { fg = c.blackberry }, -- same as Define
    PreCondit = { link = 'PreProc' }, -- preprocessor #if, #else, #endif, etc.

    StorageClass = { fg = c.mimosa }, -- static, register, volatile, etc.
    Structure = { fg = c.mimosa }, -- struct, union, enum, etc.
    Special = { fg = c.raspberry }, -- (preferred) any special symbol
    Type = { fg = c.mimosa, style = o.styles.types or {} }, -- (preferred) int, long, char, etc.
    Typedef = { link = 'Type' }, -- A typedef
    SpecialChar = { link = 'Special' }, -- special character in a constant
    Tag = { fg = c.lavender, style = { 'bold' } }, -- you can use CTRL-] on this
    Delimiter = { fg = c.overlay2 }, -- character that needs attention
    Debug = { link = 'Special' }, -- debugging statements

    Underlined = { style = { 'underline' } }, -- (preferred) text that stands out, HTML links
    Bold = { style = { 'bold' } },
    Italic = { style = { 'italic' } },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.tomato }, -- (preferred) any erroneous construct
    Todo = { fg = c.base, bg = c.mimosa, style = { 'bold' } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.mimosa },
    qfFileName = { fg = c.blueberry },

    htmlH1 = { fg = c.raspberry, style = { 'bold' } },
    htmlH2 = { fg = c.blueberry, style = { 'bold' } },

    mkdHeading = { fg = c.peach, style = { 'bold' } },
    -- mkdCode = { fg = c.text, bg = c.terminal_black },
    mkdCodeDelimiter = { bg = c.base, fg = c.text },
    mkdCodeStart = { fg = c.grapefruit, style = { 'bold' } },
    mkdCodeEnd = { fg = c.grapefruit, style = { 'bold' } },
    -- mkdLink = { fg = c.blueberry, style = { 'underline' } },

    -- markdownHeadingDelimiter = { fg = c.orange, bold = true },
    -- markdownCode = { fg = c.teal },
    -- markdownCodeBlock = { fg = c.teal },
    -- markdownH1 = { fg = c.magenta, bold = true },
    -- markdownH2 = { fg = c.blue, bold = true },
    -- markdownLinkText = { fg = c.blue, underline = true },

    -- Debugging
    debugPC = { bg = c.crust }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.overlay0, bg = c.base }, -- used for breakpoint colors in terminal-debug

    ['helpCommand'] = { bg = c.overlay2, fg = c.blueberry },

    dosIniLabel = { link = '@property' },

    -- Diffs
    -- TODO: This doesn't seem to be working.
    diffAdded = { fg = c.kale },
    diffRemoved = { fg = c.tomato },
    diffChanged = { fg = c.blueberry },
    diffOldFile = { fg = c.mimosa },
    diffNewFile = { fg = c.peach },
    diffFile = { fg = c.blueberry },
    diffLine = { fg = c.overlay0 },
    diffIndexLine = { fg = c.aqua },

    DiffAdd = { bg = c.kale }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.blueberry }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.tomato }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.blueberry }, -- diff mode: Changed text within a changed line |diff.txt|

    -- Health
    healthError = { fg = c.tomato },
    healthSuccess = { fg = c.aqua },
    healthWarning = { fg = c.mimosa },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.surface1 }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.surface1 }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.surface1 }, -- used for highlighting "write" references

    DiagnosticError = { fg = error, bg = none }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = warning, bg = none }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = info, bg = none }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = hint, bg = none }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    -- the same colour as comments
    DiagnosticUnnecessary = { fg = c.overlay0 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { fg = c.surface1, bg = c.grapefruit }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextWarn = { fg = c.surface1, bg = c.peach }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextInfo = { fg = c.surface1, bg = c.blueberry }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextHint = { fg = c.surface1, bg = c.cornflower }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    -- TODO: The `guisp` option used in these doesn't work.
    DiagnosticUnderlineError = { style = { 'underline' }, sp = error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = { 'underline' }, sp = warning }, -- Used to underline "Warn" diagnostics
    DiagnosticUnderlineInfo = { style = { 'underline' }, sp = info }, -- Used to underline "Info" diagnostics
    DiagnosticUnderlineHint = { style = { 'underline' }, sp = hint }, -- Used to underline "Hint" diagnostics

    DiagnosticFloatingError = { fg = error }, -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn = { fg = warning }, -- Used to color "Warn" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo = { fg = info }, -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint = { fg = hint }, -- Used to color "Hint" diagnostic messages in diagnostics float

    DiagnosticSignError = { fg = error }, -- Used for "Error" signs in sign column
    DiagnosticSignWarn = { fg = warning }, -- Used for "Warn" signs in sign column
    DiagnosticSignInfo = { fg = info }, -- Used for "Info" signs in sign column
    DiagnosticSignHint = { fg = hint }, -- Used for "Hint" signs in sign column

    LspDiagnosticsDefaultError = { fg = error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspSignatureActiveParameter = { fg = c.peach },
    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    LspDiagnosticsError = { fg = error },
    LspDiagnosticsWarning = { fg = warning },
    LspDiagnosticsInformation = { fg = info },
    LspDiagnosticsHint = { fg = hint },
    LspDiagnosticsVirtualTextError = { fg = error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { fg = warning }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { fg = info }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { fg = hint }, -- Used for "Hint" diagnostic virtual text
    LspDiagnosticsUnderlineError = { style = { 'underline' }, sp = error }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = { 'underline' }, sp = warning }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = { 'underline' }, sp = info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = { 'underline' }, sp = hint }, -- Used to underline "Hint" diagnostics
    LspCodeLens = { fg = c.overlay0 }, -- virtual text of the codelens
    LspInlayHint = {
      -- fg of `Comment`
      fg = c.overlay0,
      -- bg of `CursorLine`
      bg = utils.vary_color({ sunday = c.mantle }, c.mantle),
    }, -- virtual text of the inlay hints
    LspInfoBorder = { link = 'FloatBorder' }, -- LspInfo border

    ALEErrorSign = { fg = error },
    ALEWarningSign = { fg = warning },

    -- Glyphs
    GlyphPalette1 = { fg = c.tomato },
    GlyphPalette2 = { fg = c.aqua },
    GlyphPalette3 = { fg = c.mimosa },
    GlyphPalette4 = { fg = c.blueberry },
    GlyphPalette6 = { fg = c.aqua },
    GlyphPalette7 = { fg = c.text },
    GlyphPalette9 = { fg = c.tomato },

    -- Rainbow
    rainbow1 = { fg = c.tomato },
    rainbow2 = { fg = c.peach },
    rainbow3 = { fg = c.mimosa },
    rainbow4 = { fg = c.kale },
    rainbow5 = { fg = c.avocado },
    rainbow6 = { fg = c.lavender },

    -- Illuminate
    illuminatedWord = { bg = c.surface1 },
    illuminatedCurWord = { bg = c.surface1 },
    IlluminatedWordText = { bg = c.surface1 },
    IlluminatedWordRead = { bg = c.surface1 },
    IlluminatedWordWrite = { bg = c.surface1 },
  }

  return scheme
end

return M
