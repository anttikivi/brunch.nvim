-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    NotifyERRORBorder = { fg = C.tomato },
    NotifyERRORIcon = { fg = C.tomato },
    NotifyERRORTitle = { fg = C.tomato, style = { 'bold' } },
    NotifyWARNBorder = { fg = C.mimosa },
    NotifyWARNIcon = { fg = C.mimosa },
    NotifyWARNTitle = { fg = C.mimosa, style = { 'bold' } },
    NotifyINFOBorder = { fg = C.blueberry },
    NotifyINFOIcon = { fg = C.blueberry },
    NotifyINFOTitle = { fg = C.blueberry, style = { 'bold' } },
    NotifyDEBUGBorder = { fg = C.peach },
    NotifyDEBUGIcon = { fg = C.peach },
    NotifyDEBUGTitle = { fg = C.peach, style = { 'bold' } },
    NotifyTRACEBorder = { fg = C.rosewater },
    NotifyTRACEIcon = { fg = C.rosewater },
    NotifyTRACETitle = { fg = C.rosewater, style = { 'bold' } },
  }
end

return M
