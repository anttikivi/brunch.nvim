-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    Comment = { fg = C.overlay0, style = O.styles.comments }, -- just comments
    SpecialComment = { link = 'Special' }, -- special things inside a comment
    Constant = { fg = C.peach }, -- (preferred) any constant
    String = { fg = C.kale, style = O.styles.strings or {} }, -- a string constant: 'this is a string'
    Character = { fg = C.aqua }, --  a character constant: 'c', '\n'
    Number = { fg = C.peach, style = O.styles.numbers or {} }, --   a number constant: 234, 0xff
    Float = { link = 'Number' }, --    a floating point constant: 2.3e10
    Boolean = { fg = C.peach, style = O.styles.booleans or {} }, --  a boolean constant: TRUE, false
    Identifier = { fg = C.grapefruit, style = O.styles.variables or {} }, -- (preferred) any variable name
    Function = { fg = C.blueberry, style = O.styles.functions or {} }, -- function name (also: methods for classes)
    Statement = { fg = C.blackberry }, -- (preferred) any statement
    Conditional = { fg = C.blackberry, style = O.styles.conditionals or {} }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = C.blackberry, style = O.styles.loops or {} }, --   for, do, while, etc.
    Label = { fg = C.avocado }, --    case, default, etc.
    Operator = { fg = C.cornflower, style = O.styles.operators or {} }, -- 'sizeof', '+', '*', etc.
    Keyword = { fg = C.blackberry, style = O.styles.keywords or {} }, --  any other keyword
    Exception = { fg = C.blackberry, style = O.styles.keywords or {} }, --  try, catch, throw

    PreProc = { fg = C.raspberry }, -- (preferred) generic Preprocessor
    Include = { fg = C.blackberry, style = O.styles.keywords or {} }, --  preprocessor #include
    Define = { link = 'PreProc' }, -- preprocessor #define
    Macro = { fg = C.blackberry }, -- same as Define
    PreCondit = { link = 'PreProc' }, -- preprocessor #if, #else, #endif, etc.

    StorageClass = { fg = C.mimosa }, -- static, register, volatile, etc.
    Structure = { fg = C.mimosa }, --  struct, union, enum, etc.
    Special = { fg = C.raspberry }, -- (preferred) any special symbol
    Type = { fg = C.mimosa, style = O.styles.types or {} }, -- (preferred) int, long, char, etc.
    Typedef = { link = 'Type' }, --  A typedef
    SpecialChar = { link = 'Special' }, -- special character in a constant
    Tag = { fg = C.lavender, style = { 'bold' } }, -- you can use CTRL-] on this
    Delimiter = { fg = C.overlay2 }, -- character that needs attention
    Debug = { link = 'Special' }, -- debugging statements

    Underlined = { style = { 'underline' } }, -- (preferred) text that stands out, HTML links
    Bold = { style = { 'bold' } },
    Italic = { style = { 'italic' } },
    -- ('Ignore', below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = C.tomato }, -- (preferred) any erroneous construct
    Todo = { bg = C.mimosa, fg = C.base, style = { 'bold' } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { fg = C.mimosa },
    qfFileName = { fg = C.blueberry },
    htmlH1 = { fg = C.raspberry, style = { 'bold' } },
    htmlH2 = { fg = C.blueberry, style = { 'bold' } },
    -- mkdHeading = { fg = C.peach, style = { 'bold' } },
    -- mkdCode = { bg = C.terminal_black, fg = C.text },
    mkdCodeDelimiter = { bg = C.base, fg = C.text },
    mkdCodeStart = { fg = C.grapefruit, style = { 'bold' } },
    mkdCodeEnd = { fg = C.grapefruit, style = { 'bold' } },
    -- mkdLink = { fg = C.blueberry, style = { 'underline' } },

    -- debugging
    debugPC = { bg = C.crust }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = C.base, fg = C.overlay0 }, -- used for breakpoint colors in terminal-debug
    -- illuminate
    illuminatedWord = { bg = C.surface1 },
    illuminatedCurWord = { bg = C.surface1 },
    -- diff
    diffAdded = { fg = C.kale },
    diffRemoved = { fg = C.tomato },
    diffChanged = { fg = C.blueberry },
    diffOldFile = { fg = C.mimosa },
    diffNewFile = { fg = C.peach },
    diffFile = { fg = C.blueberry },
    diffLine = { fg = C.overlay0 },
    diffIndexLine = { fg = C.aqua },

    DiffAdd = { bg = C.kale }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = C.blueberry }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = C.tomato }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = C.blueberry }, -- diff mode: Changed text within a changed line |diff.txt|

    -- NeoVim
    healthError = { fg = C.tomato },
    healthSuccess = { fg = C.aqua },
    healthWarning = { fg = C.mimosa },
    -- misc

    -- glyphs
    GlyphPalette1 = { fg = C.tomato },
    GlyphPalette2 = { fg = C.aqua },
    GlyphPalette3 = { fg = C.mimosa },
    GlyphPalette4 = { fg = C.blueberry },
    GlyphPalette6 = { fg = C.aqua },
    GlyphPalette7 = { fg = C.text },
    GlyphPalette9 = { fg = C.tomato },

    -- rainbow
    rainbow1 = { fg = C.tomato },
    rainbow2 = { fg = C.peach },
    rainbow3 = { fg = C.mimosa },
    rainbow4 = { fg = C.kale },
    rainbow5 = { fg = C.avocado },
    rainbow6 = { fg = C.lavender },
  }
end

return M
