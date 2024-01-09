local ts = require 'brunch.treesitter'

local M = {}

---@param group string
---@param highlight Highlight
function M.highlight(group, highlight)
  group = ts.get(group)
  if not group then
    return
  end
  ---@type Highlight
  local hl = {}
  -- Styles are passed as 'style_name = boolean' to the Neovim API.
  if highlight.style then
    for _, style in ipairs(highlight.style) do
      hl[style] = true
    end
  end
  if highlight.fg then
    hl.ctermfg = highlight.fg
  end
  if highlight.bg then
    hl.ctermbg = highlight.bg
  end
  if highlight.link then
    hl.link = highlight.link
  end
  vim.api.nvim_set_hl(0, group, hl)
end

---@param scheme Scheme
function M.load(scheme)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.o.termguicolors = false
  vim.g.colors_name = 'brunch'

  if ts.new_style() then
    for group, colors in pairs(ts.defaults) do
      if not scheme.highlights[group] then
        M.highlight(group, colors)
      end
    end
  end

  for group, highlight in pairs(scheme.highlights) do
    M.highlight(group, highlight)
  end

  if scheme.options.terminal_colors then
    vim.g.terminal_color_0 = scheme.colors.overlay0
    vim.g.terminal_color_8 = scheme.colors.overlay1

    vim.g.terminal_color_1 = scheme.colors.tomato
    vim.g.terminal_color_9 = scheme.colors.tomato

    vim.g.terminal_color_2 = scheme.colors.kale
    vim.g.terminal_color_10 = scheme.colors.kale

    vim.g.terminal_color_3 = scheme.colors.mimosa
    vim.g.terminal_color_11 = scheme.colors.mimosa

    vim.g.terminal_color_4 = scheme.colors.blueberry
    vim.g.terminal_color_12 = scheme.colors.blueberry

    vim.g.terminal_color_5 = scheme.colors.raspberry
    vim.g.terminal_color_13 = scheme.colors.raspberry

    vim.g.terminal_color_6 = scheme.colors.cornflower
    vim.g.terminal_color_14 = scheme.colors.cornflower

    vim.g.terminal_color_7 = scheme.colors.text
    vim.g.terminal_color_15 = scheme.colors.text
  end

  local group = vim.api.nvim_create_augroup('brunch', { clear = true })

  vim.api.nvim_create_autocmd('ColorSchemePre', {
    group = group,
    callback = function()
      vim.api.nvim_del_augroup_by_id(group)
    end,
  })
end

---@param palettes table<Variant, number>>
---@param default number
---@param opts Options|nil
---@return number
function M.vary_color(palettes, default, opts)
  local variant = vim.o.background == 'light' and 'sunday' or 'saturday'

  if variant == nil then
    return default
  end

  if palettes[variant] == nil then
    return default
  end

  return palettes[variant]
end

return M
