-- Credit: https://github.com/catppuccin/nvim

local M = {}

local virtual_text = O.integrations.native_lsp.virtual_text

function M.get()
  return { -- Personally the default integration is already pretty good
    NoiceCmdline = { fg = C.text },
    NoiceCmdlineIcon = { fg = C.cornflower, style = virtual_text.information },
    NoiceCmdlineIconSearch = { fg = C.mimosa },
    NoiceCmdlinePopupBorder = { fg = C.lavender },
    NoiceCmdlinePopupBorderSearch = { fg = C.mimosa },
    NoiceConfirmBorder = { fg = C.blueberry },
    NoiceMini = { fg = C.text, blend = 0 },
  }
end

return M
