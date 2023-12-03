-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  local bg = C.lavender
  local fg = C.base

  local secondary_bg = C.blue
  local secondary_fg = C.base

  local muted_bg = C.overlay0
  local muted_fg = C.base

  return {
    MasonHeader = { fg = fg, bg = bg, style = { 'bold' } },
    MasonHeaderSecondary = {
      fg = secondary_fg,
      bg = secondary_bg,
      style = { 'bold' },
    },

    MasonHighlight = { fg = C.green },
    MasonHighlightBlock = { bg = C.green, fg = C.base },
    MasonHighlightBlockBold = {
      bg = secondary_bg,
      fg = secondary_fg,
      bold = true,
    },

    MasonHighlightSecondary = { fg = C.mauve },
    MasonHighlightBlockSecondary = { fg = secondary_fg, bg = secondary_bg },
    MasonHighlightBlockBoldSecondary = { fg = fg, bg = bg, bold = true },

    MasonMuted = { fg = C.overlay0 },
    MasonMutedBlock = { bg = muted_bg, fg = muted_fg },
    MasonMutedBlockBold = { bg = C.yellow, fg = C.base, bold = true },

    MasonError = { fg = C.red },

    MasonHeading = { fg = C.lavender, bold = true },
  }
end

return M
