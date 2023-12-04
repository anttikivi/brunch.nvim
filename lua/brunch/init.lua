local utils = require 'brunch.utils'

local M = {}

---@class Config
local default_opts = {
  variant = 'sunday',
  background = {
    light = 'sunday',
    dark = 'saturday',
  },
  terminal_colors = false,
}

---@type Config
M.options = {}

---@param opts Config|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend('force', default_opts, opts or {})
end

---@param opts Config|nil
function M.extend(opts)
  M.options =
    vim.tbl_deep_extend('force', M.options or default_opts, opts or {})
end

---@param opts Config|nil
function M.load(opts)
  if opts then
    M.extend(opts)
  end

  utils.load(M.options)
end

return M
