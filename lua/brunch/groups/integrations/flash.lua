-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    FlashBackdrop = { fg = C.overlay0 },
    FlashLabel = { fg = C.kale, bg = C.base, style = { 'bold' } },
    FlashMatch = { fg = C.lavender, bg = C.base },
    FlashCurrent = { fg = C.peach, bg = C.base },
    FlashPrompt = { link = 'NormalFloat' },
  }
end

return M
