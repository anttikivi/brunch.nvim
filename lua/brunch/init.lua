---@type Brunch
local M = {
  default_opts = {
    compile_path = vim.fn.stdpath 'cache' .. '/brunch',
  },
  path_sep = jit and (jit.os == 'Windows' and '\\' or '/')
    or package.config:sub(1, 1),
}

M.options = M.default_opts

local is_set_up = false

---@diagnostic disable-next-line: inject-field
function M.compile() end

---@type fun(opts: BrunchOptions?)
function M.setup(usr_opts)
  is_set_up = true
  usr_opts = usr_opts or {}
  M.options = vim.tbl_deep_extend('keep', usr_opts, M.default_opts)

  local cached_path = M.options.compile_path .. M.path_sep .. 'cache'
  local file = io.open(cached_path)
  local cached = nil
  if file then
    cached = file:read()
    file:close()
  end

  local git_path = debug.getinfo(1).source:sub(2, -24) .. '.git'
  local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
  local hash = require('brunch.lib.hash').hash(usr_opts)
    .. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
    .. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
    .. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend

  if cached ~= hash then
    M.compile()
    file = io.open(cached_path, 'wb')
    if file then
      file:write(hash)
      file:close()
    end
  end
end

return M
