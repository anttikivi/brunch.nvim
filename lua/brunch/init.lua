local scheme = require 'brunch.scheme'
local utils = require 'brunch.utils'

local M = {}

---@alias Variant 'sunday' | 'saturday'

---@class Options
local default_opts = {
  variants = {
    ---@type Variant
    light = 'sunday',
    ---@type Variant
    dark = 'saturday',
  },
  terminal_colors = false,
  styles = {
    comments = { 'italic' },
  },
}

---@type Options
M.options = {}

---@param opts Options|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend('force', default_opts, opts or {})
end

---@param opts Options|nil
function M.extend(opts)
  M.options =
    vim.tbl_deep_extend('force', M.options or default_opts, opts or {})
end

---@param opts Options|nil
function M.load(opts)
  if opts then
    M.extend(opts)
  end

  utils.load(scheme.create())
end

return M
