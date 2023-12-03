-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    GitSignsAdd = { fg = C.green }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = C.yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = C.red }, -- diff mode: Deleted line |diff.txt|

    GitSignsCurrentLineBlame = { fg = C.surface1 },

    GitSignsAddPreview = { link = 'DiffAdd' },
    GitSignsDeletePreview = { link = 'DiffDelete' },
  }
end

return M
