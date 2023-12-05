-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    GitSignsAdd = { fg = C.kale }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = C.mimosa }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = C.tomato }, -- diff mode: Deleted line |diff.txt|

    GitSignsCurrentLineBlame = { fg = C.surface1 },

    GitSignsAddPreview = { link = 'DiffAdd' },
    GitSignsDeletePreview = { link = 'DiffDelete' },
  }
end

return M
