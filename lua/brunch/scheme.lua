local palette = require 'brunch.palette'
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
  }

  return scheme
end

return M
