require("full-border"):setup()
require("git"):setup()
require("recycle-bin"):setup()

-- https://yazi-rs.github.io/docs/tips#symlink-in-status
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)


-- https://yazi-rs.github.io/docs/tips#user-group-in-status
Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)

--[[
require("starship"):setup({
    -- Hide flags (such as filter, find and search). This is recommended for starship themes which
    -- are intended to go across the entire width of the terminal.
    hide_flags = false, -- Default: false
    -- Whether to place flags after the starship prompt. False means the flags will be placed before the prompt.
    flags_after_prompt = true, -- Default: true
    -- Custom starship configuration file to use
    -- config_file = "~/.config/starship_full.toml", -- Default: nil
})
--]]
