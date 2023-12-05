-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  local scope_color = O.integrations.indent_blankline.scope_color

  local hi = {
    IblIndent = { fg = C.surface0 },
    IblScope = { fg = C[scope_color] or C.text },
  }

  if O.integrations.indent_blankline.colored_indent_levels then
    hi['RainbowRed'] = { blend = 0, fg = C.tomato }
    hi['RainbowYellow'] = { blend = 0, fg = C.mimosa }
    hi['RainbowBlue'] = { blend = 0, fg = C.blueberry }
    hi['RainbowOrange'] = { blend = 0, fg = C.peach }
    hi['RainbowGreen'] = { blend = 0, fg = C.kale }
    hi['RainbowViolet'] = { blend = 0, fg = C.blackberry }
    hi['RainbowCyan'] = { blend = 0, fg = C.aqua }
  end

  return hi
end

return M
