-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    NotifyERRORBorder = { fg = C.red },
    NotifyERRORIcon = { fg = C.red },
    NotifyERRORTitle = { fg = C.red, style = { 'bold' } },
    NotifyWARNBorder = { fg = C.yellow },
    NotifyWARNIcon = { fg = C.yellow },
    NotifyWARNTitle = { fg = C.yellow, style = { 'bold' } },
    NotifyINFOBorder = { fg = C.blue },
    NotifyINFOIcon = { fg = C.blue },
    NotifyINFOTitle = { fg = C.blue, style = { 'bold' } },
    NotifyDEBUGBorder = { fg = C.peach },
    NotifyDEBUGIcon = { fg = C.peach },
    NotifyDEBUGTitle = { fg = C.peach, style = { 'bold' } },
    NotifyTRACEBorder = { fg = C.rosewater },
    NotifyTRACEIcon = { fg = C.rosewater },
    NotifyTRACETitle = { fg = C.rosewater, style = { 'bold' } },
  }
end

return M
