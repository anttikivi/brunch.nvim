-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    HarpoonWindow = { fg = C.text, bg = C.base },
    HarpoonBorder = { fg = C.blue },
  }
end

return M
