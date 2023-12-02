---@class Brunch
---@field options BrunchOptions?
---@field setup fun(opts: BrunchOptions?)

---@alias BrunchFlavor 'sunday' | 'friday'

---@class BrunchOptions
---- The directory where the cache is stored.
---@field compile_path string?
