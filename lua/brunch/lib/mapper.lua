-- Credit: https://github.com/catppuccin/nvim

local M = {}

function M.apply(variant)
  variant = variant or require('brunch').variant

  local _O, _C, _U = O, C, U
  O = require('brunch').options
  C = require('brunch.palettes').get_palette(variant)
  U = require 'brunch.utils.colors'

  C.none = 'NONE'

  local theme = {}

  theme.syntax = require('brunch.groups.syntax').get()
  theme.editor = require('brunch.groups.editor').get()

  local final_integration = {}

  for integration in pairs(O.integrations) do
    local cot = false

    if type(O.integrations[integration]) == 'table' then
      cot = O.integrations[integration].enabled == true
    elseif O.integrations[integration] == true then
      -- TODO: Shouldn't this be default_opts.integrations[integration]?
      O.integrations[integration] = require('brunch').default_opts[integration]
        or {}
      O.integrations[integration].enabled = true
      cot = true
    end

    if cot then
      final_integration = vim.tbl_deep_extend(
        'force',
        final_integration,
        require('brunch.groups.integrations.' .. integration).get()
      )
    end
  end

  theme.integrations = final_integration
  theme.terminal = require('brunch.groups.terminal').get()

  local user_highlights = O.highlight_overrides

  if type(user_highlights[variant]) == 'function' then
    user_highlights[variant] = user_highlights[variant](C)
  end

  theme.custom_highlights = vim.tbl_deep_extend(
    'keep',
    user_highlights[variant] or {},
    type(user_highlights.all) == 'function' and user_highlights.all(C)
      or user_highlights.all
      or {}
  )

  O, C, U = _O, _C, _U -- Returning global var

  return theme
end

return M
