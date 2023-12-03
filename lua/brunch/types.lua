-- Credit: https://github.com/catppuccin/nvim

---@class Brunch
---@field options BrunchOptions?
---@field setup fun(opts: BrunchOptions?)

---@alias BrunchVariant 'sunday' | 'saturday'
---@alias BrunchColor 'rosewater' | 'flamingo' | 'pink' | 'mauve' | 'red' | 'maroon' | 'peach' | 'yellow' | 'green' | 'teal' | 'sky' | 'sapphire' | 'blue' | 'lavender' | 'text' | 'subtext1' | 'subtext0' | 'overlay2' | 'overlay1' | 'overlay0' | 'surface2' | 'surface1' | 'surface0' | 'base' | 'mantle' | 'crust'
---@class BrunchVariants<T>: { all: T, sunday: T, saturday: T }
---@class BrunchColors<T>: { rosewater: T, flamingo: T, pink: T, mauve: T, red: T, maroon: T, peach: T, yellow: T, green: T, teal: T, sky: T, sapphire: T, blue: T, lavender: T, text: T, subtext1: T, subtext0: T, overlay2: T, overlay1: T, overlay0: T, surface2: T, surface1: T, surface0: T, base: T, mantle: T, crust: T, none: T }

---@class BrunchOptions
-- Changes the variant based on the background. See `:h background` for more info.
---@field background BrunchBackground?
---- The directory where the cache is stored.
---@field compile_path string?
-- Handles the style of general hl groups (see `:h highlight-groups`).
---@field styles BrunchStyles?
---- Catppuccin colors can be overwritten here.
---@field color_overrides BrunchColors | BrunchVariants<BrunchColors<string>> | nil
---- The default variant to use on startup.
---@field variant BrunchVariant?

---@class BrunchBackground
-- Catppuccin flavor to use when `:set background=dark` is set.
---@field dark BrunchVariant?
-- Catppuccin flavor to use when `:set background=light` is set.
---@field light BrunchVariant?

---@class BrunchStyles
-- Change the style of comments.
---@field comments BrunchHighlightArgs[]?
-- Change the style of conditionals.
---@field conditionals BrunchHighlightArgs[]?
-- Change the style of loops.
---@field loops BrunchHighlightArgs[]?
-- Change the style of functions.
---@field functions BrunchHighlightArgs[]?
-- Change the style of keywords.
---@field keywords BrunchHighlightArgs[]?
-- Change the style of strings.
---@field strings BrunchHighlightArgs[]?
-- Change the style of variables.
---@field variables BrunchHighlightArgs[]?
-- Change the style of numbers.
---@field numbers BrunchHighlightArgs[]?
-- Change the style of booleans.
---@field booleans BrunchHighlightArgs[]?
-- Change the style of properties.
---@field properties BrunchHighlightArgs[]?
-- Change the style of types.
---@field types BrunchHighlightArgs[]?
-- Change the style of operators.
---@field operators BrunchHighlightArgs[]?

---@alias BrunchHighlightArgs "bold" | "underline" | "undercurl" | "underdouble" | "underdotted" | "underdashed" | "strikethrough" | "reverse" | "inverse" | "italic" | "standout" | "altfont" | "nocombine" | "NONE"
