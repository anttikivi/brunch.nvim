-- Credit: https://github.com/catppuccin/nvim

local path_sep = require('brunch').path_sep
local O = require('brunch').options
local M = {}

local fmt = string.format

local function inspect(t)
  local list = {}

  for k, v in pairs(t) do
    local tv = type(v)
    if tv == 'string' then
      table.insert(list, fmt([[%s = '%s']], k, v))
    elseif tv == 'table' then
      table.insert(list, fmt([[%s = %s]], k, inspect(v)))
    else
      table.insert(list, fmt([[%s = %s]], k, tostring(v)))
    end
  end

  return fmt([[{ %s }]], table.concat(list, ', '))
end

function M.compile(variant)
  local theme = require('brunch.lib.mapper').apply(variant)
  local lines = {
    string.format(
      [[
return string.dump(function()
vim.o.termguicolors = false
if vim.g.colors_name then vim.cmd('hi clear') end
vim.o.background = '%s'
vim.g.colors_name = 'brunch-%s'
local h = vim.api.nvim_set_hl]],
      variant == 'sunday' and 'light' or 'dark',
      variant
    ),
  }

  if path_sep == '\\' then
    O.compile_path = O.compile_path:gsub('/', '\\')
  end

  local tbl = vim.tbl_deep_extend(
    'keep',
    theme.custom_highlights,
    theme.integrations,
    theme.syntax,
    theme.editor
  )

  if O.term_colors == true then
    for k, v in pairs(theme.terminal) do
      table.insert(lines, fmt("vim.g.%s = '%s'", k, v))
    end
  end

  for group, color in pairs(tbl) do
    if color.style then
      for _, style in pairs(color.style) do
        color[style] = true

        if O.no_bold and style == 'bold' then
          color[style] = false
        end

        if O.no_underline and style == 'underline' then
          color[style] = false
        end
      end
    end

    color.style = nil

    if
      color.link
      and (
        theme.custom_highlights[group]
        and not theme.custom_highlights[group].link
      )
    then
      color.link = nil
    end

    table.insert(lines, fmt([[h(0, '%s', %s)]], group, inspect(color)))
  end

  table.insert(lines, 'end, true)')

  if vim.fn.isdirectory(O.compile_path) == 0 then
    vim.fn.mkdir(O.compile_path, 'p')
  end

  if vim.g.brunch_debug then -- Debugging purpose
    local deb = io.open(O.compile_path .. path_sep .. variant .. '.lua', 'wb')
    if deb then
      deb:write(table.concat(lines, '\n'))
      deb:close()
    end
  end

  local f = loadstring(table.concat(lines, '\n'))

  if not f then
    local err_path = (path_sep == '/' and '/tmp' or os.getenv 'TMP')
      .. '/brunch_error.lua'
    print(
      string.format(
        [[Brunch (error): Most likely some mistake made in your Brunch config
You can open %s for debugging

If you think this is a bug, kindly open an issue and attach %s file
Below is the error message that we captured:
]],
        err_path,
        err_path
      )
    )

    local err = io.open(err_path, 'wb')
    if err then
      err:write(table.concat(lines, '\n'))
      err:close()
    end

    dofile(err_path)

    return
  end

  local file = assert(
    io.open(O.compile_path .. path_sep .. variant, 'wb'),
    'Permission denied while writing compiled file to '
      .. O.compile_path
      .. path_sep
      .. variant
  )

  file:write(f())
  file:close()
end

return M
