-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.get()
  return {
    Dash = { fg = C.overlay2, style = { 'bold' } },
    Quote = { link = '@text.strong' },
    CodeBlock = { bg = C.mantle },
    Headline = { link = 'Headline1' },
    Headline1 = { bg = C.surface0, fg = C.tomato },
    Headline2 = { bg = C.surface0, fg = C.peach },
    Headline3 = { bg = C.surface0, fg = C.mimosa },
    Headline4 = { bg = C.surface0, fg = C.kale },
    Headline5 = { bg = C.surface0, fg = C.avocado },
    Headline6 = { bg = C.surface0, fg = C.lavender },
  }
end

return M
