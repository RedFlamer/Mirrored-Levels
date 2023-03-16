if core then
	core:module("CoreGuiDataManager")
end

local mvec3_set_x = mvector3.set_x
local mvec3_x = mvector3.x

local funcs = {
	"create_saferect_workspace",
	"create_fullscreen_workspace",
	"create_fullscreen_16_9_workspace",
	"create_corner_saferect_workspace",
	"create_1280_workspace",
	"create_corner_saferect_1280_workspace",
}

for _, funcname in ipairs(funcs) do
	local func_orig = GuiDataManager[funcname]
	GuiDataManager[funcname] = function(...)
		local ws = func_orig(...)
		local meta = getmetatable(ws)
		if not meta.setup_mirrored then
			local world_to_screen_orig = meta.world_to_screen
			function meta.world_to_screen(...)
				local screen_pos = world_to_screen_orig(...)
				local res_x = ws:width()
				local screen_x = -(mvec3_x(screen_pos) - res_x)

				mvec3_set_x(screen_pos, screen_x)

				return screen_pos
			end

			meta.setup_mirrored = true
		end

		return ws
	end
end