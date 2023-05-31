---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "ayu_dark" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = {
    load_on_startup = true,
    header = {
      "______ _      _     _           ______",
      "| ___ (_)    | |   (_)         |___  /",
      "| |_/ /_  ___| |__  _  ___ ______ / / ",
      "|    /| |/ __| '_ \\| |/ _ \\______/ /  ",
      "| |\\ \\| | (__| | | | |  __/    ./ /___",
      "\\_| \\_|_|\\___|_| |_|_|\\___|    \\_____/",
    },
  },
  transparency = false,
  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.format_on_save = 1 -- 1= true 0=false

return M
