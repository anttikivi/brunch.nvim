-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    TroubleText = { fg = C.kale },
    TroubleCount = { fg = C.raspberry, bg = C.surface1 },
    TroubleNormal = { fg = C.text, bg = C.crust },
  }
end

return M
