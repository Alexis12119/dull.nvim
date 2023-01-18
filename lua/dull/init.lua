local util = require "dull.util"
local theme = require "dull.theme"
local config = require "dull.config"

local M = {}

function M._load(style)
  if style and config.options.style ~= style then
    config.options.style = style
  end
  vim.g.dull_style = config.options.style
  M.load { style = style }
end

function M.load(opts)
  if opts then
    require("dull.config").extend(opts)
  end

  if config.options.transparent then
    vim.opt.pumblend = 0
  end

  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
