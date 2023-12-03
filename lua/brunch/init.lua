-- Credit: https://github.com/catppuccin/nvim

---@type Brunch
local M = {
  default_opts = {
    background = {
      light = 'sunday',
      dark = 'saturday',
    },
    compile_path = vim.fn.stdpath 'cache' .. '/brunch',
    show_end_of_buffer = false,
    term_colors = false,
    no_bold = false,
    no_underline = false,
    styles = {
      comments = { 'italic' },
      conditionals = { 'italic' },
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
    integrations = {
      cmp = true,
      dashboard = true,
      flash = true,
      gitsigns = true,
      harpoon = true,
      headlines = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
    color_overrides = {},
    highlight_overrides = {},
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

  local git_path = debug.getinfo(1).source:sub(2, -20) .. '.git'
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

vim.api.nvim_create_user_command('Brunch', function(inp)
  vim.api.nvim_command('colorscheme brunch-' .. get_variant(inp.args))
end, {
  nargs = 1,
  complete = function(line)
    return vim.tbl_filter(function(val)
      return vim.startswith(val, line)
    end, vim.tbl_keys(M.variants))
  end,
})

vim.api.nvim_create_user_command('BrunchCompile', function()
  for name, _ in pairs(package.loaded) do
    if name:match '^brunch.' then
      package.loaded[name] = nil
    end
  end
  M.compile()
  vim.notify('Brunch (info): compiled cache!', vim.log.levels.INFO)
  vim.cmd.colorscheme 'brunch'
end, {})

if vim.g.brunch_debug then
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*/brunch/*',
    callback = function()
      vim.schedule(function()
        vim.cmd 'BrunchCompile'
      end)
    end,
  })
end

return M
