local palette = require 'brunch.palette'
local M = {}

---@return Scheme
function M.create()
  local brunch = require 'brunch'
  local options = brunch.options

  ---@class Scheme
  ---@field highlights Highlights
  local scheme = {
    colors = palette.get(options),
    options = options,
  }

  ---@class Highlight
  ---@field fg string|number|nil
  ---@field bg string|number|nil
  ---@field style string[]|nil
  ---@field link string|nil
  ---@field ctermfg string|number|nil
  ---@field ctermbg string|number|nil

  ---@alias Highlights table<string, Highlight>
  ---@type Highlights
  scheme.highlights = {}

  return scheme
end

return M
