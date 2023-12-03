-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.apply(variant)
  variant = variant or require('brunch').variant

  -- local _O, _C, _U = O, C, U
  local _O, _C = O, C
  O = require('brunch').options
  C = require('brunch.palettes').get_palette(variant)

  C.none = 'NONE'

  local theme = {}

  theme.syntax = require('brunch.groups.syntax').get()
  theme.editor = require('brunch.groups.editor').get()

  local final_integration = {}
end

return M
