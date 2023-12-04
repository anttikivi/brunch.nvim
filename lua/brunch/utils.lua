local M = {}

---@param theme Theme
function M.load(theme)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end
end

return M
