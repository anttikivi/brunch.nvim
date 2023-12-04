-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  local bg_highlight = C.base

  local inactive_bg = C.mantle

  local indentscope_color = O.integrations.mini.indentscope_color
  return {
    MiniCompletionActiveParameter = { style = { 'underline' } },

    MiniCursorword = { style = { 'underline' } },
    MiniCursorwordCurrent = { style = { 'underline' } },

    MiniIndentscopeSymbol = { fg = C[indentscope_color] or C.text },
    MiniIndentscopePrefix = { style = { 'nocombine' } }, -- Make it invisible

    MiniJump = { fg = C.overlay2, bg = C.raspberry },

    MiniJump2dSpot = {
      bg = C.base,
      fg = C.peach,
      style = { 'bold', 'underline' },
    },

    MiniStarterCurrent = {},
    MiniStarterFooter = { fg = C.mimosa, style = { 'italic' } },
    MiniStarterHeaker = { fg = C.blueberry },
    MiniStarterInactive = { fg = C.surface2, style = O.styles.comments },
    MiniStarterItem = { fg = C.text },
    MiniStarterItemBullet = { fg = C.blueberry },
    MiniStarterItemPrefix = { fg = C.raspberry },
    MiniStarterSection = { fg = C.grapefruit },
    MiniStarterQuery = { fg = C.kale },

    MiniStatuslineDevinfo = { fg = C.subtext1, bg = C.surface1 },
    MiniStatuslineFileinfo = { fg = C.subtext1, bg = C.surface1 },
    MiniStatuslineFilename = { fg = C.text, bg = C.mantle },
    MiniStatuslineInactive = { fg = C.blueberry, bg = C.mantle },
    MiniStatuslineModeCommand = {
      fg = C.base,
      bg = C.peach,
      style = { 'bold' },
    },
    MiniStatuslineModeInsert = { fg = C.base, bg = C.kale, style = { 'bold' } },
    MiniStatuslineModeNormal = {
      fg = C.mantle,
      bg = C.blueberry,
      style = { 'bold' },
    },
    MiniStatuslineModeOther = { fg = C.base, bg = C.aqua, style = { 'bold' } },
    MiniStatuslineModeReplace = { fg = C.base, bg = C.tomato, style = { 'bold' } },
    MiniStatuslineModeVisual = { fg = C.base, bg = C.blackberry, style = { 'bold' } },

    MiniSurround = { bg = C.raspberry, fg = C.surface1 },

    MiniTablineCurrent = {
      fg = C.text,
      bg = C.base,
      sp = C.tomato,
      style = { 'bold', 'italic', 'underline' },
    },
    MiniTablineFill = { bg = bg_highlight },
    MiniTablineHidden = { fg = C.text, bg = inactive_bg },
    MiniTablineModifiedCurrent = {
      fg = C.tomato,
      bg = C.none,
      style = { 'bold', 'italic' },
    },
    MiniTablineModifiedHidden = { fg = C.tomato, bg = C.none },
    MiniTablineModifiedVisible = { fg = C.tomato, bg = C.none },
    MiniTablineTabpagesection = { fg = C.surface1, bg = C.base },
    MiniTablineVisible = { bg = C.none },

    MiniTestEmphasis = { style = { 'bold' } },
    MiniTestFail = { fg = C.tomato, style = { 'bold' } },
    MiniTestPass = { fg = C.kale, style = { 'bold' } },

    MiniTrailspace = { bg = C.tomato },
  }
end

return M
