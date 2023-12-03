-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.vary_color(palettes, default)
  local vrnt = require('brunch').variant

  if palettes[vrnt] ~= nil then
    return palettes[vrnt]
  end

  return default
end

return M
