local config = require('neovide-support.config')
local M = {}
M.setup = config.setup
function M.load(opts)
	config.setup(opts)
	opts = require('neovide-support.config').extend(opts)
	if vim.loop.os_uname().sysname == "Windows_NT" then
		vim.g.neovide_title_background_color =
				string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
		vim.g.neovide_title_text_color = "pink"
	else
	end
	-- set font
	vim.g.neovide_refresh_rate = opts.refresh_rate
	vim.o.guifont = opts.font
	vim.g.neovide_fullscreen = true
	vim.g.neovide_remember_window_size = opts.remember_window_size
	-- Hiding the mouse when typing
	vim.g.neovide_hide_mouse_when_typing = true
	-- Underline automatic scaling
	vim.g.neovide_underline_automatic_scaling = true
	-- Theme
	vim.g.neovdie_theme = "auto"
	-- Refresh Rate
	vim.g.neovide_refresh_rate_idle = 5
	-- Cursor animation length
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.4
	-- Scroll Animation Length
	vim.g.neovide_scroll_animation_length = 0.3
	-- Cursor particle opacity
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_opacity = 80.0
	-- Particle config
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.6
	vim.o.clipboard = "unnamedplus"
	vim.keymap.set("n", "<C-s>", ":w<CR>")     -- Save
	vim.keymap.set("v", "<C-c>", '"+y')        -- Copy
	vim.keymap.set("n", "<C-v>", '"+P')        -- Paste normal mode
	vim.keymap.set("v", "<C-v>", '"+P')        -- Paste visual mode
	vim.keymap.set("c", "<C-v>", "<C-R>+")     -- Paste command mode
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
	vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })
end

return M
