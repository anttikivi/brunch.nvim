local M = {}

function M.get()
  return {
    terminal_color_0 = C.overlay0,
    terminal_color_8 = C.overlay1,

    terminal_color_1 = C.tomato,
    terminal_color_9 = C.tomato,

    terminal_color_2 = C.kale,
    terminal_color_10 = C.kale,

    terminal_color_3 = C.mimosa,
    terminal_color_11 = C.mimosa,

    terminal_color_4 = C.blueberry,
    terminal_color_12 = C.blueberry,

    terminal_color_5 = C.raspberry,
    terminal_color_13 = C.raspberry,

    terminal_color_6 = C.cornflower,
    terminal_color_14 = C.cornflower,

    terminal_color_7 = C.text,
    terminal_color_15 = C.text,
  }
end

return M
