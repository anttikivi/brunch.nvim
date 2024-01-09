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

  ---@alias HighlightStyle 'bold' | 'italic' | 'underline' | 'undercurl' | 'strikethrough'

  ---@class Highlight
  ---@field fg string|number|nil
  ---@field bg string|number|nil
  ---@field style HighlightStyle[]|nil
  ---@field link string|nil
  ---@field ctermfg string|number|nil
  ---@field ctermbg string|number|nil

  -- The default highlight groups and their values:
  -- https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c
  ---@alias Highlights table<string, Highlight>
  ---@type Highlights
  scheme.highlights = {
    Comment = { fg = c.overlay0, style = o.styles.comments or {} }, -- any comment
    ColorColumn = { bg = c.surface0 },                              -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.overlay1 },                                  -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.base, bg = c.text },                          -- character under the cursor
    lCursor = { fg = c.base, bg = c.text },                         -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.base, bg = c.text },                        -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.mantle },                               -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.mantle },                                 -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
    Directory = { fg = c.blueberry },                               -- directory names (and other special names in listings)
    EndOfBuffer = { fg = c.subtext0 },                              -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { fg = c.tomato, style = { 'bold', 'italic' } },     -- error messages on the command line
    VertSplit = { fg = c.crust },                                   -- the column separating vertically split windows
    WinSeparator = { fg = c.crust, bold = true },                   -- the column separating vertically split windows
    Folded = { fg = c.blueberry, bg = c.surface1 },                 -- line used for closed folds
    FoldColumn = { fg = c.overlay0 },                               -- 'foldcolumn'

    -- TODO: This doesn't seem to be working.
    SignColumn = { fg = c.surface1 },                 -- column where |signs| are displayed
    SignColumnSB = { fg = c.surface1, bg = c.crust }, -- column where |signs| are displayed

    Substitute = {
      fg = utils.vary_color({ sunday = c.tomato }, c.raspberry),
      bg = c.surface1,
    },                                                                  -- |:substitute| replacement text highlighting
    LineNr = { fg = c.overlay2 },                                       -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.peach },                                    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.peach, bg = c.surface1, style = { 'bold' } }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.text, style = { 'bold' } },                      -- 'showmode' message (e.g., "-- INSERT -- ")

    -- TODO: Neovim bug.
    -- MsgArea = { fg = c.text }, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832

    MsgSeparator = {},                        -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blueberry },           -- |more-prompt|
    NonText = { fg = c.overlay0 },            -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.text },                 -- normal text
    NormalNC = { fg = c.text },               -- normal text in non-current windows
    NormalSB = { fg = c.text, bg = c.crust }, -- normal text in non-current windows
    NormalFloat = {
      fg = c.text,
      bg = utils.vary_color({ saturday = c.overlay0 }, c.surface0),
    },                                                               -- Normal text in floating windows.
    FloatBorder = { fg = c.blueberry },
    FloatTitle = { fg = c.subtext0 },                                -- Title of floating windows
    Pmenu = { fg = c.subtext1, bg = c.surface1 },                    -- Popup menu: normal item.
    PmenuSel = { fg = c.aqua, bg = c.surface0, style = { 'bold' } }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.surface1 },                                 -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.overlay0 },                                -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blueberry },                                 -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.surface1, style = { 'bold' } },          -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = c.mantle, bg = c.grapefruit },                   -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { fg = c.mantle, bg = c.rosewater },                 -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { fg = c.mantle, bg = c.raspberry },                 -- 'cursearch' highlighting: highlights the current search you're on differently
    SpecialKey = { link = 'NonText' },                               -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
    -- TODO: The `guisp` option used in these doesn't work, and the undercurl
    -- usually shows up as an underline.
    SpellBad = { sp = c.tomato, style = { 'undercurl' } },      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.mimosa, style = { 'undercurl' } },      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.blueberry, style = { 'undercurl' } }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.kale, style = { 'undercurl' } },       -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- TODO: Check these at some point.
    StatusLine = { fg = c.text, bg = c.mantle },         -- status line of current window
    StatusLineNC = { fg = c.surface1, bg = c.mantle },   -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.surface1, bg = c.mantle },        -- tab pages line, not active tab page label
    TabLineFill = {},                                    -- tab pages line, where there are no labels
    TabLineSel = { fg = c.kale, bg = c.surface1 },       -- tab pages line, active tab page label

    Title = { fg = c.blueberry, style = { 'bold' } },    -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.surface1, style = { 'bold' } },    -- Visual mode selection
    VisualNOS = { bg = c.surface1, style = { 'bold' } }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.mimosa },                      -- warning messages
    Whitespace = { fg = c.surface1 },                    -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.overlay0 },                      -- current match in 'wildmenu' completion
    WinBar = { fg = c.rosewater },                       -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups, but they are de facto
    -- standard group names for syntax highlighting.

    SpecialComment = { link = 'Special' },                                    -- special things inside a comment
    Constant = { fg = c.peach },                                              -- (preferred) any constant
    String = { fg = c.kale, style = o.styles.strings or {} },                 -- a string constant: 'this is a string'
    Character = { fg = c.aqua },                                              -- a character constant: 'c', '\n'
    Number = { fg = c.peach, style = o.styles.numbers or {} },                -- a number constant: 234, 0xff
    Float = { link = 'Number' },                                              -- a floating point constant: 2.3e10
    Boolean = { fg = c.peach, style = o.styles.booleans or {} },              -- a boolean constant: TRUE, false
    Identifier = { fg = c.grapefruit, style = o.styles.variables or {} },     -- (preferred) any variable name
    Function = { fg = c.blueberry, style = o.styles.functions or {} },        -- function name (also: methods for classes)
    Statement = { fg = c.blackberry },                                        -- (preferred) any statement
    Conditional = { fg = c.blackberry, style = o.styles.conditionals or {} }, -- if, then, else, endif, switch, etc.
    Repeat = { fg = c.blackberry, style = o.styles.loops or {} },             -- for, do, while, etc.
    Label = { fg = c.avocado },                                               -- case, default, etc.
    Operator = { fg = c.cornflower, style = o.styles.operators or {} },       -- 'sizeof', '+', '*', etc.
    Keyword = { fg = c.blackberry, style = o.styles.keywords or {} },         -- any other keyword
    Exception = { fg = c.blackberry, style = o.styles.keywords or {} },       -- try, catch, throw

    PreProc = { fg = c.raspberry },                                           -- (preferred) generic Preprocessor
    Include = { fg = c.blackberry, style = o.styles.keywords or {} },         -- preprocessor #include
    Define = { link = 'PreProc' },                                            -- preprocessor #define
    Macro = { fg = c.blackberry },                                            -- same as Define
    PreCondit = { link = 'PreProc' },                                         -- preprocessor #if, #else, #endif, etc.

    StorageClass = { fg = c.mimosa },                                         -- static, register, volatile, etc.
    Structure = { fg = c.mimosa },                                            -- struct, union, enum, etc.
    Special = { fg = c.raspberry },                                           -- (preferred) any special symbol
    Type = { fg = c.mimosa, style = o.styles.types or {} },                   -- (preferred) int, long, char, etc.
    Typedef = { link = 'Type' },                                              -- A typedef
    SpecialChar = { link = 'Special' },                                       -- special character in a constant
    Tag = { fg = c.lavender, style = { 'bold' } },                            -- you can use CTRL-] on this
    Delimiter = { fg = c.overlay2 },                                          -- character that needs attention
    Debug = { link = 'Special' },                                             -- debugging statements

    Underlined = { style = { 'underline' } },                                 -- (preferred) text that stands out, HTML links
    Bold = { style = { 'bold' } },
    Italic = { style = { 'italic' } },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.tomato },                                 -- (preferred) any erroneous construct
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
    debugPC = { bg = c.crust },                         -- used for highlighting the current line in terminal-debug
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

    DiffAdd = { bg = c.kale },         -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.blueberry }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.tomato },    -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.blueberry },   -- diff mode: Changed text within a changed line |diff.txt|

    -- Health
    healthError = { fg = c.tomato },
    healthSuccess = { fg = c.aqua },
    healthWarning = { fg = c.mimosa },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.surface1 },                              -- used for highlighting "text" references
    LspReferenceRead = { bg = c.surface1 },                              -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.surface1 },                             -- used for highlighting "write" references

    DiagnosticError = { fg = error, bg = none },                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = warning, bg = none },                        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = info, bg = none },                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = hint, bg = none },                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    -- the same colour as comments
    DiagnosticUnnecessary = { fg = c.overlay0 },                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { fg = c.surface1, bg = c.grapefruit }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextWarn = { fg = c.surface1, bg = c.peach },       -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextInfo = { fg = c.surface1, bg = c.blueberry },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextHint = { fg = c.surface1, bg = c.cornflower },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    -- TODO: The `guisp` option used in these doesn't work.
    DiagnosticUnderlineError = { style = { 'underline' }, sp = error },  -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = { 'underline' }, sp = warning }, -- Used to underline "Warn" diagnostics
    DiagnosticUnderlineInfo = { style = { 'underline' }, sp = info },    -- Used to underline "Info" diagnostics
    DiagnosticUnderlineHint = { style = { 'underline' }, sp = hint },    -- Used to underline "Hint" diagnostics

    DiagnosticFloatingError = { fg = error },                            -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn = { fg = warning },                           -- Used to color "Warn" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo = { fg = info },                              -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint = { fg = hint },                              -- Used to color "Hint" diagnostic messages in diagnostics float

    DiagnosticSignError = { fg = error },                                -- Used for "Error" signs in sign column
    DiagnosticSignWarn = { fg = warning },                               -- Used for "Warn" signs in sign column
    DiagnosticSignInfo = { fg = info },                                  -- Used for "Info" signs in sign column
    DiagnosticSignHint = { fg = hint },                                  -- Used for "Hint" signs in sign column

    LspDiagnosticsDefaultError = { fg = error },                         -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = warning },                     -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = info },                    -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = hint },                           -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspSignatureActiveParameter = { fg = c.peach },
    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    LspDiagnosticsError = { fg = error },
    LspDiagnosticsWarning = { fg = warning },
    LspDiagnosticsInformation = { fg = info },
    LspDiagnosticsHint = { fg = hint },
    LspDiagnosticsVirtualTextError = { fg = error },                             -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { fg = warning },                         -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { fg = info },                        -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { fg = hint },                               -- Used for "Hint" diagnostic virtual text
    LspDiagnosticsUnderlineError = { style = { 'underline' }, sp = error },      -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = { 'underline' }, sp = warning },  -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = { 'underline' }, sp = info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = { 'underline' }, sp = hint },        -- Used to underline "Hint" diagnostics
    LspCodeLens = { fg = c.overlay0 },                                           -- virtual text of the codelens
    LspInlayHint = {
      -- fg of `Comment`
      fg = c.overlay0,
      -- bg of `CursorLine`
      bg = utils.vary_color({ sunday = c.mantle }, c.mantle),
    },                                        -- virtual text of the inlay hints
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
    rainbow7 = { fg = c.blueberry },
    rainbowcol1 = { fg = c.tomato },
    rainbowcol2 = { fg = c.peach },
    rainbowcol3 = { fg = c.mimosa },
    rainbowcol4 = { fg = c.kale },
    rainbowcol5 = { fg = c.avocado },
    rainbowcol6 = { fg = c.lavender },
    rainbowcol7 = { fg = c.blueberry },
    -- TODO: Rainbow delimiters

    -- These groups are for the Neovim tree-sitter highlights.
    -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

    -- Misc
    ['@comment'] = { link = 'Comment' },               -- line and block comments
    -- TODO:
    ['@comment.documentation'] = { link = 'Comment' }, -- comments documenting code
    ['@error'] = { link = 'Error' },                   -- syntax/parser errors
    -- TODO:
    -- ['@none'] = { },
    ['@preproc'] = { link = 'PreProc' },   -- various preprocessor directives & shebangs
    ['@define'] = { link = 'Define' },     -- preprocessor definition directives
    ['@operator'] = { link = 'Operator' }, -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ['@punctuation.delimiter'] = { link = 'Delimiter' }, -- delimiters (e.g. `;` / `.` / `,`).
    ['@punctuation.bracket'] = { fg = c.overlay2 },      -- brackets (e.g. `()` / `{}` / `[]`)
    ['@punctuation.special'] = { link = 'Special' },     -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    ['@string'] = { link = 'String' },                                         -- string literals
    -- TODO:
    ['@string.documentation'] = { link = 'String' },                           -- string documenting code (e.g. Python docstrings)
    ['@string.regex'] = { fg = c.peach, style = o.styles.strings or {} },      -- regular expressions
    ['@string.escape'] = { fg = c.raspberry, style = o.styles.strings or {} }, -- escape sequences
    ['@string.special'] = { link = 'Special' },                                -- other special strings (e.g. dates)

    ['@character'] = { link = 'Character' },                                   -- character literals
    ['@character.special'] = { link = 'SpecialChar' },                         -- special characters (e.g. wildcards)

    ['@boolean'] = { link = 'Boolean' },                                       -- boolean literals
    ['@number'] = { link = 'Number' },                                         -- numeric literals
    ['@float'] = { link = 'Float' },                                           -- floating-point number literals

    -- Functions
    ['@function'] = { link = 'Function' },                                      -- function definitions
    ['@function.builtin'] = { fg = c.peach, style = o.styles.functions or {} }, -- built-in functions
    ['@function.call'] = { link = 'Function' },                                 -- function calls
    ['@function.macro'] = { fg = c.aqua, style = o.styles.functions or {} },    -- preprocessor macros

    ['@method'] = { link = 'Function' },                                        -- method definitions
    ['@method.call'] = { link = 'Function' },                                   -- method calls

    ['@constructor'] = { fg = c.avocado },                                      -- constructor calls and definitions
    ['@parameter'] = { fg = c.cranberry, style = o.styles.variables or {} },    -- parameters of a function

    -- Keywords
    ['@keyword'] = { link = 'Keyword' },           -- various keywords
    ['@keyword.coroutine'] = { link = 'Keyword' }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ['@keyword.function'] = {
      fg = c.blackberry,
      style = o.styles.keywords or {},
    }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ['@keyword.operator'] = {
      fg = c.blackberry,
      style = o.styles.operators or {},
    },                                                                            -- operators that are English words (e.g. `and` / `or`)
    ['@keyword.return'] = { fg = c.blackberry, style = o.styles.keywords or {} }, -- operators that are English words (e.g. `and` / `or`)
    -- JS & derivative
    ['@keyword.export'] = { fg = c.cornflower, style = o.styles.keywords },

    ['@conditional'] = { link = 'Conditional' },       -- keywords related to conditionals (e.g. `if` / `else`)
    ['@conditional.ternary'] = { link = '@operator' }, -- ternary operator (e.g. `?` / `:`)

    ['@repeat'] = { link = 'Repeat' },                 -- keywords related to loops (e.g. `for` / `while`)
    -- TODO:
    -- ['@debug'] = { link = 'Debug' }, -- keywords related to debugging
    ['@label'] = { link = 'Label' },         -- GOTO and other labels (e.g. `label:` in C)
    ['@include'] = { link = 'Include' },     -- keywords for including modules (e.g. `import` / `from` in Python)
    ['@exception'] = { link = 'Exception' }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Types
    ['@type'] = { link = 'Type' }, -- type or class definitions and annotations
    ['@type.builtin'] = {
      fg = c.mimosa,
      style = o.styles.properties or { 'italic' },
    },                                                                      -- builtin types
    ['@type.definition'] = { link = 'Type' },                               -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
    ['@type.qualifier'] = { link = 'Keyword' },                             -- type qualifiers (e.g. `const`)

    ['@storageclass'] = { link = 'StorageClass' },                          -- modifiers that affect storage in memory or life-time
    ['@attribute'] = { link = 'Constant' },                                 -- attribute annotations (e.g. Python decorators)
    ['@field'] = { fg = c.lavender },                                       -- object and struct fields
    ['@property'] = { fg = c.lavender, style = o.styles.properties or {} }, -- similar to `@field`

    -- Identifiers
    ['@variable'] = { fg = c.text, style = o.styles.variables or {} },            -- various variable names
    ['@variable.builtin'] = { fg = c.tomato, style = o.styles.properties or {} }, -- built-in variable names (e.g. `this`)

    ['@constant'] = { link = 'Constant' },                                        -- constant identifiers
    ['@constant.builtin'] = { fg = c.peach, style = o.styles.keywords or {} },    -- built-in constant values
    ['@constant.macro'] = { link = 'Macro' },                                     -- constants defined by the preprocessor

    ['@namespace'] = { fg = c.lavender, style = { 'italic' } },                   -- modules or namespaces
    ['@symbol'] = { fg = c.grapefruit },                                          -- symbols or atoms

    -- Text
    ['@text'] = { fg = c.text },                                             -- non-structured text
    ['@text.strong'] = { fg = c.cranberry, style = { 'bold' } },             -- bold text
    ['@text.emphasis'] = { fg = c.cranberry, style = { 'italic' } },         -- text with emphasis
    ['@text.underline'] = { link = 'Underline' },                            -- underlined text
    ['@text.strike'] = { fg = c.text, style = { 'strikethrough' } },         -- strikethrough text
    ['@text.title'] = { fg = c.blueberry, style = { 'bold' } },              -- text that is part of a title
    ['@text.uri'] = { fg = c.rosewater, style = { 'italic', 'underline' } }, -- URIs (e.g. hyperlinks)
    ['@text.math'] = { fg = c.blueberry },                                   -- math environments (e.g. `$ ... $` in LaTeX)
    ['@text.environment'] = { fg = c.raspberry },                            -- text environments of markup languages
    ['@text.environment.name'] = { fg = c.blueberry },                       -- text indicating the type of an environment
    ['@text.reference'] = { link = 'Tag' },                                  -- text references, footnotes, citations, etc.

    ['@text.literal'] = { fg = c.aqua },                                     -- literal or verbatim text (e.g., inline code)
    -- TODO:
    -- ['@text.literal.block'] = { fg = c.aqua }, -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    ['@text.todo'] = { fg = c.base, bg = c.mimosa },    -- todo notes
    ['@text.todo.checked'] = { fg = c.kale },           -- todo notes
    ['@text.todo.unchecked'] = { fg = c.overlay1 },     -- todo notes
    ['@text.note'] = { fg = c.base, bg = c.blueberry }, -- info notes
    ['@text.warning'] = { fg = c.base, bg = c.mimosa }, -- warning notes
    ['@text.danger'] = { fg = c.base, bg = c.tomato },  -- danger/error notes

    ['@text.diff.add'] = { link = 'diffAdded' },        -- added text (for diff files)
    ['@text.diff.delete'] = { link = 'diffRemoved' },   -- deleted text (for diff files)

    -- Tags
    ['@tag'] = { fg = c.blackberry },                           -- XML tag names
    ['@tag.attribute'] = { fg = c.aqua, style = { 'italic' } }, -- XML tag attributes
    ['@tag.delimiter'] = { fg = c.cornflower },                 -- XML tag delimiters

    -- Language specific:
    -- Bash
    ['@function.builtin.bash'] = { fg = c.tomato, style = { 'italic' } },

    -- Markdown
    ['@text.title.1.markdown'] = { link = 'rainbow1' },
    ['@text.title.2.markdown'] = { link = 'rainbow2' },
    ['@text.title.3.markdown'] = { link = 'rainbow3' },
    ['@text.title.4.markdown'] = { link = 'rainbow4' },
    ['@text.title.5.markdown'] = { link = 'rainbow5' },
    ['@text.title.6.markdown'] = { link = 'rainbow6' },

    -- Java
    ['@constant.java'] = { fg = c.aqua },

    -- CSS
    ['@property.css'] = { fg = c.lavender },
    ['@property.id.css'] = { fg = c.blueberry },
    ['@property.class.css'] = { fg = c.mimosa },
    ['@type.css'] = { fg = c.lavender },
    ['@type.tag.css'] = { fg = c.blackberry },
    ['@string.plain.css'] = { fg = c.peach },
    ['@number.css'] = { fg = c.peach },

    -- TOML
    ['@property.toml'] = { fg = c.blueberry }, -- Differentiates between string and properties

    -- JSON
    ['@label.json'] = { fg = c.blueberry }, -- For labels: label: in C and :label: in Lua.

    -- Lua
    ['@constructor.lua'] = { fg = c.grapefruit }, -- For constructor calls and definitions: = { } in Lua.

    -- TypeScript
    ['@property.typescript'] = {
      fg = c.lavender,
      style = o.styles.properties or {},
    },
    ['@constructor.typescript'] = { fg = c.lavender },

    -- TSX (TypeScript React)
    ['@constructor.tsx'] = { fg = c.lavender },
    ['@tag.attribute.tsx'] = { fg = c.blackberry, style = { 'italic' } },

    -- YAML
    ['@field.yaml'] = { fg = c.blueberry }, -- For fields.

    -- Ruby
    ['@symbol.ruby'] = { fg = c.grapefruit },

    -- PHP
    ['@method.php'] = { link = 'Function' },
    ['@method.call.php'] = { link = 'Function' },

    -- C/C++
    ['@type.builtin.c'] = { fg = c.mimosa, style = {} },
    ['@property.cpp'] = { fg = c.text },
    ['@type.builtin.cpp'] = { fg = c.mimosa, style = {} },

    -- Misc
    gitcommitSummary = { fg = c.rosewater, style = { 'italic' } },
    zshKSHFunction = { link = 'Function' },

    -- LSP Semantic Token Groups
    ['@lsp.type.boolean'] = { link = '@boolean' },
    ['@lsp.type.builtinType'] = { link = '@type.builtin' },
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.escapeSequence'] = { link = '@string.escape' },
    ['@lsp.type.formatSpecifier'] = { link = '@punctuation.special' },
    ['@lsp.type.interface'] = { fg = c.grapefruit },
    ['@lsp.type.keyword'] = { link = '@keyword' },
    ['@lsp.type.namespace'] = { link = '@namespace' },
    ['@lsp.type.number'] = { link = '@number' },
    ['@lsp.type.operator'] = { link = '@operator' },
    ['@lsp.type.parameter'] = { link = '@parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.selfKeyword'] = { link = '@variable.builtin' },
    ['@lsp.type.typeAlias'] = { link = '@type.definition' },
    ['@lsp.type.unresolvedReference'] = { link = '@error' },
    ['@lsp.type.variable'] = {}, -- use treesitter styles for regular variables
    ['@lsp.typemod.class.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enum.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enumMember.defaultLibrary'] = { link = '@constant.builtin' },
    ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.keyword.async'] = { link = '@keyword.coroutine' },
    ['@lsp.typemod.macro.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.operator.injected'] = { link = '@operator' },
    ['@lsp.typemod.string.injected'] = { link = '@string' },
    ['@lsp.typemod.type.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },
    ['@lsp.typemod.variable.injected'] = { link = '@variable' },

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
