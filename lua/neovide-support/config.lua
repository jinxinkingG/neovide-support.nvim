local M = {}

M.defaults = {
  refresh_rate = 60,
  fullscreen = false,
  remember_window_size = true,
  font = 'FiraMono Nerd Font,DejaVuSansM Nerd Font:h18'
}
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

M.options = nil

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

return M
