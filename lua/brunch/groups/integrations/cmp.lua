-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    CmpItemAbbr = { fg = C.subtext0, bg = C.surface1 },
    -- TODO: See for an alternative to strikethrough as it's probably not
    -- supported.
    CmpItemAbbrDeprecated = { fg = C.overlay0, style = { 'strikethrough' } },
    CmpItemKind = { fg = C.blueberry },
    CmpItemMenu = { fg = C.text },
    CmpItemAbbrMatch = { fg = C.cornflower, style = { 'bold' } },
    CmpItemAbbrMatchFuzzy = { fg = C.cornflower, style = { 'bold' } },

    -- kind support
    CmpItemKindSnippet = { fg = C.blackberry },
    CmpItemKindKeyword = { fg = C.tomato },
    CmpItemKindText = { fg = C.aqua },
    CmpItemKindMethod = { fg = C.blueberry },
    CmpItemKindConstructor = { fg = C.blueberry },
    CmpItemKindFunction = { fg = C.blueberry },
    CmpItemKindFolder = { fg = C.blueberry },
    CmpItemKindModule = { fg = C.blueberry },
    CmpItemKindConstant = { fg = C.peach },
    CmpItemKindField = { fg = C.kale },
    CmpItemKindProperty = { fg = C.kale },
    CmpItemKindEnum = { fg = C.kale },
    CmpItemKindUnit = { fg = C.kale },
    CmpItemKindClass = { fg = C.mimosa },
    CmpItemKindVariable = { fg = C.grapefruit },
    CmpItemKindFile = { fg = C.blueberry },
    CmpItemKindInterface = { fg = C.mimosa },
    CmpItemKindColor = { fg = C.tomato },
    CmpItemKindReference = { fg = C.tomato },
    CmpItemKindEnumMember = { fg = C.tomato },
    CmpItemKindStruct = { fg = C.blueberry },
    CmpItemKindValue = { fg = C.peach },
    CmpItemKindEvent = { fg = C.blueberry },
    CmpItemKindOperator = { fg = C.blueberry },
    CmpItemKindTypeParameter = { fg = C.blueberry },
    CmpItemKindCopilot = { fg = C.aqua },
  }
end

return M
