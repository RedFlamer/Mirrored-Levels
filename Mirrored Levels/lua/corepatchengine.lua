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