local M = {}

-- set colorscheme style based on time
local colorscheme_style_by_time = function()
  local time = tonumber(os.date "%H")
  if time >= 0 and time <= 15 then
    return "slime"
  elseif time >= 16 and time <= 17 then
    return "sunset"
  else
    return "night"
  end
end

local defaults = {
  style = colorscheme_style_by_time(),
}

M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

function M.extend(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

M.setup()

return M
