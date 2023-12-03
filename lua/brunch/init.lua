-- Credit: https://github.com/catppuccin/nvim

---@type Brunch
local M = {
  default_opts = {
    background = {
      light = 'sunday',
      dark = 'saturday',
    },
    compile_path = vim.fn.stdpath 'cache' .. '/brunch',
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
  },
  variants = { sunday = 1, saturday = 2 },
  path_sep = jit and (jit.os == 'Windows' and '\\' or '/')
    or package.config:sub(1, 1),
}

M.options = M.default_opts

local function get_variant(default)
  local variant

  if
    default
    and default == M.variant
    and vim.o.background ~= (M.variant == 'sunday' and 'light' or 'dark')
  then
    variant = M.options.background[vim.o.background]
  else
    variant = default
  end

  if variant and not M.variants[variant] then
    vim.notify(
      string.format(
        "Brunch (error): Invalid variant '%s', variant must be either 'sunday' or 'saturday'",
        variant
      ),
      vim.log.levels.ERROR
    )
    variant = nil
  end

  return variant
    or M.options.variant
    or vim.g.brunch_variant
    or M.options.background[vim.o.background]
end

function M.compile()
  local user_variant = M.variant

  for variant, _ in pairs(M.variants) do
    M.variant = variant
    require('brunch.lib.compiler').compile(variant)
  end

  M.variant = user_variant
end

local is_set_up = false

function M.load(variant)
  if not is_set_up then
    M.setup()
  end

  M.variant = get_variant(variant)

  local compiled_path = M.options.compile_path .. M.path_sep .. M.variant
  local file = loadfile(compiled_path)

  if not file then
    M.compile()
    file = assert(loadfile(compiled_path), 'could not load the cache')
  end

  file()
end

---@type fun(opts: BrunchOptions?)
function M.setup(user_opts)
  is_set_up = true
  user_opts = user_opts or {}
  M.options = vim.tbl_deep_extend('keep', user_opts, M.default_opts)

  local cached_path = M.options.compile_path .. M.path_sep .. 'cache'
  local file = io.open(cached_path)
  local cached = nil
  if file then
    cached = file:read()
    file:close()
  end

  local git_path = debug.getinfo(1).source:sub(2, -24) .. '.git'
  local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
  local hash = require('brunch.lib.hash').hash(user_opts)
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
