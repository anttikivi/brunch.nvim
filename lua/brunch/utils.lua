local M = {}

---@param scheme Scheme
function M.load(scheme)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.o.termguicolors = false
  vim.g.colors_name = 'brunch'

  for group, highlight in pairs(scheme.highlights) do
    ---@type Highlight
    local hl = {}
    -- Styles are passed as 'style_name = boolean'.
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
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
