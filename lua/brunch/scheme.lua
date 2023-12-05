local M = {}

---@return Scheme
function M.create()
  ---@class Scheme
  local scheme = {}

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
end

return M
