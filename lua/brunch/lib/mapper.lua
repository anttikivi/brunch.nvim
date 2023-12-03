-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.apply(variant)
  variant = variant or require('brunch').variant
end
return M
