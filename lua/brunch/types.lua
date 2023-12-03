-- Credit: https://github.com/catppuccin/nvim

---@class Brunch
---@field variant BrunchVariant?
---@field options BrunchOptions?
---@field compile fun()
---@field load fun(variant: BrunchVariant?)
---@field setup fun(opts: BrunchOptions?)

---@alias BrunchVariant 'sunday' | 'saturday'

---@class BrunchOptions
---- The directory where the cache is stored.
---@field compile_path string?
---- The default variant to use on startup.
---@field variant BrunchVariant?
