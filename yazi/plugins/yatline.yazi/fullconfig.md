-- full config
 require("yatline"):setup({
	show_background = false,

	display_header_line = false,
	display_status_line = true,

	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	-- section_separator = { open = "", close = "" },
	-- part_separator = { open = "", close = "" },
	-- inverse_separator = { open = "", close = "" },


	header_line = {
		left = {
			section_a = {
        			-- {type = "line", custom = false, name = "tabs", params = {"left"}},
			},
			section_b = {
			},
			section_c = {
			}
		},
		right = {
			section_a = {
        			-- {type = "coloreds", custom = true, name = {{" 󰇥 ", "#3c3836"}}},
							{type = "coloreds", custom = false, name = "count", params = "true"}, 
			},
			section_b = {
			},
			section_c = {
        			-- {type = "coloreds", custom = false, name = "count"},
			}
		}
	},

	status_line = {
		left = {
			section_a = {
			},
			section_b = {
			},
			section_c = {
			}
		},
		right = {
			section_a = {
			},
			section_b = {
			},
			section_c = {
			}
		}
	},
})
