-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    CmpItemAbbr = { fg = C.subtext0, bg = C.surface1 },
    -- TODO: See for an alternative to strikethrough as it's probably not
    -- supported.
    CmpItemAbbrDeprecated = { fg = C.overlay0, style = { 'strikethrough' } },
    CmpItemKind = { fg = C.blue },
    CmpItemMenu = { fg = C.text },
    CmpItemAbbrMatch = { fg = C.sky, style = { 'bold' } },
    CmpItemAbbrMatchFuzzy = { fg = C.sky, style = { 'bold' } },

    -- kind support
    CmpItemKindSnippet = { fg = C.mauve },
    CmpItemKindKeyword = { fg = C.red },
    CmpItemKindText = { fg = C.teal },
    CmpItemKindMethod = { fg = C.blue },
    CmpItemKindConstructor = { fg = C.blue },
    CmpItemKindFunction = { fg = C.blue },
    CmpItemKindFolder = { fg = C.blue },
    CmpItemKindModule = { fg = C.blue },
    CmpItemKindConstant = { fg = C.peach },
    CmpItemKindField = { fg = C.green },
    CmpItemKindProperty = { fg = C.green },
    CmpItemKindEnum = { fg = C.green },
    CmpItemKindUnit = { fg = C.green },
    CmpItemKindClass = { fg = C.yellow },
    CmpItemKindVariable = { fg = C.flamingo },
    CmpItemKindFile = { fg = C.blue },
    CmpItemKindInterface = { fg = C.yellow },
    CmpItemKindColor = { fg = C.red },
    CmpItemKindReference = { fg = C.red },
    CmpItemKindEnumMember = { fg = C.red },
    CmpItemKindStruct = { fg = C.blue },
    CmpItemKindValue = { fg = C.peach },
    CmpItemKindEvent = { fg = C.blue },
    CmpItemKindOperator = { fg = C.blue },
    CmpItemKindTypeParameter = { fg = C.blue },
    CmpItemKindCopilot = { fg = C.teal },
  }
end

return M
