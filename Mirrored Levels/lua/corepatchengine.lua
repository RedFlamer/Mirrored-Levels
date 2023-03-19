local flip_axis = {
	[Idstring("freeflight_axis_move"):key()] = true,
	[Idstring("freeflight_axis_look"):key()] = true,
	[Idstring("move"):key()] = true,
	[Idstring("drive"):key()] = true,
	[Idstring("look"):key()] = true,
	[Idstring("turn_left"):key()] = true,
	[Idstring("turn_right"):key()] = true,
}

local mvec3_set_x = mvector3.set_x
local mvec3_set_y = mvector3.set_y
local mvec3_x = mvector3.x
local mvec3_y = mvector3.y

if VirtualController then
	local axis_orig = VirtualController.axis
	function VirtualController:axis(type, ...)
		local axis = axis_orig(self, type, ...)
		if axis then
			if flip_axis[type:key()] then
				mvec3_set_x(axis, -mvec3_x(axis))
			end

			return axis
		end
	end
end

local World = getmetatable(World)
local funcs = {
	"gui",
	"newgui"
}

for _, funcname in ipairs(funcs) do
	local func_orig = World[funcname]
	World[funcname] = function(...)
		local gui = func_orig(...)
		local meta = getmetatable(gui)
		if not meta.setup_mirrored then
			local create_object_workspace_orig = meta.create_object_workspace
			function meta.create_object_workspace(...)
				local ws = create_object_workspace_orig(...)
				ws:mirror_x(true)

				return ws
			end

			meta.setup_mirrored = true
		end

		return gui
	end
end