local M = {}

M.base_30 = {
  white = "#d9dfe7",
  black = "#171f2b", -- usually your theme bg
  darker_black = "#0c1117", -- 6% darker than black
  black2 = "#222d3f", -- 6% lighter than black
  one_bg = "#29374c", -- 10% lighter than black
  one_bg2 = "#334560", -- 6% lighter than one_bg2
  one_bg3 = "#3e5474", -- 6% lighter than one_bg3
  grey = "#55739f", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#6380ab", -- 10% lighter than grey
  grey_fg2 = "#738db4", -- 5% lighter than grey
  light_grey = "#94a8c6",
  red = "#f76769",
  baby_pink = "#fa7b7c",
  pink = "#FD8DA3",
  line = "#32435d", -- for lines like vertsplit
  green = "#17b877",
  vibrant_green = "#77D5A3",
  nord_blue = "#6796E6",
  blue = "#92A9FF",
  yellow = "#FFD395",
  sun = "#CD9731",
  purple = "#a87ffb",
  dark_purple = "#8964e8",
  teal = "#3399cc",
  orange = "#fc8f8e",
  cyan = "#85CDF1",
  statusline_bg = "#334560",
  lightbg = "#3e5474",
  pmenu_bg = "#f76769",
  folder_bg = "#a87ffb",
}

M.base_16 = {
  base00 = "#171f2b",
  base01 = "#0c1117",
  base02 = "#222d3f",
  base03 = "#55739f",
  base04 = "#94a8c6",
  base05 = "#b3daff",
  base06 = "#a9c7d6",
  base07 = "#5d6a7d",
  base08 = "#a87ffb",
  base09 = "#3399cc",
  base0A = "#FFD395",
  base0B = "#85CDF1",
  base0C = "#BD9CFE", -- curly braces
  base0D = "#77D5A3",
  base0E = "#FD8DA3",
  base0F = "#8964e8",
}

M.type = "dark" -- light / dark

return M
