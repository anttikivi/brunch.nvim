local M = {}

---@class Palette
M.sunday = {
  rosewater = 174,
  grapefruit = 209,
  raspberry = 206,
  blackberry = 92,
  tomato = 1,
  cranberry = 160,
  peach = 202,
  mimosa = 3,
  kale = 40,
  aqua = 30,
  cornflower = 69,
  avocado = 29,
  blueberry = 27,
  lavender = 63,
  text = 232,
  subtext1 = 235,
  subtext0 = 240,
  overlay2 = 242,
  overlay1 = 244,
  overlay0 = 246,
  surface2 = 253,
  surface1 = 254,
  surface0 = 255,
  base = 255,
  mantle = 254,
  crust = 254,
}

---@type Palette
M.saturday = {
  rosewater = 244,
  grapefruit = 225,
  raspberry = 219,
  blackberry = 183,
  tomato = 9,
  cranberry = 218,
  peach = 215,
  mimosa = 11,
  kale = 10,
  aqua = 122,
  cornflower = 123,
  avocado = 45,
  blueberry = 39,
  lavender = 147,
  text = 15,
  subtext1 = 254,
  subtext0 = 252,
  overlay2 = 248,
  overlay1 = 245,
  overlay0 = 243,
  surface2 = 240,
  surface1 = 238,
  surface0 = 237,
  base = 234,
  mantle = 233,
  crust = 232,
}

---@param opts Options|nil
---@return Palette
function M.get(opts)
  opts = opts or {}

  ---@type Variant
  local variant = vim.o.background == 'light' and 'sunday' or 'saturday'
  ---@type Palette
  local palette = M[variant]

  -- TODO: Add cusomisation options here.

  return palette
end

return M
