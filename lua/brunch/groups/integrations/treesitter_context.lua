-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    TreesitterContextBottom = { sp = C.surface0, style = { 'underline' } },
    TreesitterContextLineNumber = { fg = C.surface1, bg = C.mantle },
  }
end

return M
