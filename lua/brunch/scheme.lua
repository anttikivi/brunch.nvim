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

  ---@class Highlight
  ---@field fg string|number|nil
  ---@field bg string|number|nil
  ---@field style string[]|nil
  ---@field link string|nil
  ---@field ctermfg string|number|nil
  ---@field ctermbg string|number|nil

  ---@alias Highlights table<string, Highlight>
  ---@type Highlights
  scheme.highlights = {
    Comment = { fg = c.overlay0, style = opts.styles.comments }, -- any comment
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
    SignColumnSB = { bg = c.crust, fg = c.surface1 }, -- column where |signs| are displayed

    Substitute = {
      bg = c.surface1,
      fg = utils.vary_color({ sunday = c.tomato }, c.raspberry),
    }, -- |:substitute| replacement text highlighting

    LineNr = { fg = c.overlay2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.peach }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    MatchParen = { fg = c.peach, bg = c.surface1, style = { 'bold' } }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

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
  }

  return scheme
end

return M
