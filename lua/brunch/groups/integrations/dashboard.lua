-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    DashboardShortCut = { fg = C.raspberry },
    DashboardHeader = { fg = C.blueberry },
    DashboardCenter = { fg = C.kale },
    DashboardFooter = { fg = C.mimosa },
    DashboardMruTitle = { fg = C.cornflower },
    DashboardProjectTitle = { fg = C.cornflower },
    DashboardFiles = { fg = C.lavender },
    DashboardKey = { fg = C.peach },
    DashboardDesc = { fg = C.blueberry },
    DashboardIcon = { fg = C.raspberry, bold = true },
  }
end

return M
