-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get_palette(variant)
  local vrnt = variant
    or require('brunch').variant
    or vim.g.brunch_variant
    or 'sunday'
  local _, palette = pcall(require, 'brunch.palettes.' .. vrnt)
  local O = require('brunch').options
  local ans = vim.tbl_deep_extend(
    'keep',
    O.color_overrides.all or {},
    O.color_overrides[vrnt] or {},
    palette or {}
  )
  return ans
end

return M
