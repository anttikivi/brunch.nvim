-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    WhichKey = { link = 'NormalFloat' },
    WhichKeyBorder = { link = 'FloatBorder' },

    WhichKeyGroup = { fg = C.blueberry },
    WhichKeySeparator = { fg = C.overlay0 },
    WhichKeyDesc = { fg = C.raspberry },
    WhichKeyValue = { fg = C.overlay0 },
  }
end

return M
