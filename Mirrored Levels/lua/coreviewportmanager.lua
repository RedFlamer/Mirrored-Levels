core:module("CoreViewportManager")

local mvec3_set_x = mvector3.set_x
local mvec3_x = mvector3.x

local new_vp_orig = ViewportManager.new_vp
function ViewportManager:new_vp(...)
	local svp = new_vp_orig(self, ...)

	local meta = getmetatable(svp)
	local set_camera_orig = meta.set_camera
	function meta:set_camera(...)
		local meta = getmetatable(self)
		if not meta.setup_mirrored then
			local world_to_screen_orig = meta.world_to_screen
			function meta.world_to_screen(...)
				local screen_pos = world_to_screen_orig(...)
				local res_x = mvec3_x(RenderSettings.resolution)
				local screen_x = -(mvec3_x(screen_pos) - res_x)

				mvec3_set_x(screen_pos, screen_x)

				return screen_pos
			end

			meta.setup_mirrored = true
		end

		return set_camera_orig(self, ...)
	end

	return svp
end