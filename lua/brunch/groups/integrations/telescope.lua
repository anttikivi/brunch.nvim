-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    -- TelescopeNormal = { link = 'NormalFloat' }, -- Respect telescope's default float bg
    TelescopeBorder = { link = 'FloatBorder' },
    TelescopeSelectionCaret = { fg = C.flamingo },
    TelescopeSelection = { fg = C.text, bg = C.surface0, style = { 'bold' } },
    TelescopeMatching = { fg = C.blue },
  }
end

return M
