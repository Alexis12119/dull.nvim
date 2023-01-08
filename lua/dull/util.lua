local M = {}

local function hexToRgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, amount)
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or M.fg, amount)
end

function M.invert_color(color)
  local hsluv = require "tokyonight.hsluv"
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function M.invert_colors(colors)
  if type(colors) == "string" then
    ---@diagnostic disable-next-line: return-type-mismatch
    return M.invert_color(colors)
  end
  for key, value in pairs(colors) do
    colors[key] = M.invert_colors(value)
  end
  return colors
end

function M.invert_highlights(hls)
  for _, hl in pairs(hls) do
    if hl.fg then
      hl.fg = M.invert_color(hl.fg)
    end
    if hl.bg then
      hl.bg = M.invert_color(hl.bg)
    end
    if hl.sp then
      hl.sp = M.invert_color(hl.sp)
    end
  end
end

function M.load(theme)
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  if vim.api.nvim_get_option "termguicolors" == false then
    vim.opt.termguicolors = true
  end
  vim.g.colors_name = "dull"

  for name, colors in pairs(theme.highlights) do
    if not vim.tbl_isempty(colors) then
      vim.api.nvim_set_hl(0, name, colors)
    end
  end

  for name, value in pairs(theme.terminal_colors) do
    vim.g[name] = value
  end
end

return M
