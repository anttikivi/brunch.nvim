local opts = require('brunch').options
local palette = require('brunch.palette').get()
local utils = require 'brunch.utils'

local brunch = {}

brunch.normal = {
  a = { fg = palette.base, bg = palette.cornflower },
  b = { fg = palette.base, bg = palette.lavender },
  c = { fg = palette.base, bg = palette.blueberry },
}

brunch.insert = {
  a = { fg = palette.base, bg = palette.avocado },
  b = { fg = palette.base, bg = palette.kale },
  y = { fg = palette.base, bg = palette.lavender },
  z = { fg = palette.base, bg = palette.cornflower },
}

brunch.command = {
  a = { fg = palette.base, bg = palette.peach },
  b = { fg = palette.base, bg = palette.mimosa },
  y = { fg = palette.base, bg = palette.lavender },
  z = { fg = palette.base, bg = palette.cornflower },
}

brunch.visual = {
  a = { fg = palette.base, bg = palette.blackberry },
  b = {
    fg = utils.vary_color({ sunday = palette.subtext1 }, palette.base, opts),
    bg = palette.rosewater,
  },
  y = { fg = palette.base, bg = palette.lavender },
  z = { fg = palette.base, bg = palette.cornflower },
}

brunch.replace = {
  a = { fg = palette.base, bg = palette.grapefruit },
  b = { fg = palette.base, bg = palette.cranberry },
  y = { fg = palette.base, bg = palette.lavender },
  z = { fg = palette.base, bg = palette.cornflower },
}

brunch.terminal = {
  a = { fg = palette.base, bg = palette.peach },
  b = { fg = palette.base, bg = palette.mimosa },
  y = { fg = palette.base, bg = palette.lavender },
  z = { fg = palette.base, bg = palette.cornflower },
}

brunch.inactive = {
  a = { fg = palette.base, bg = palette.surface2 },
  b = { fg = palette.base, bg = palette.surface1 },
  c = { fg = palette.base, bg = palette.surface0 },
}

return brunch
