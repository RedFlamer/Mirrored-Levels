local mvec3_set_x = mvector3.set_x
local mvec3_x = mvector3.x

local _update_rot_orig = FPCameraPlayerBase._update_rot
function FPCameraPlayerBase:_update_rot(axis, unscaled_axis, ...)
	mvec3_set_x(axis, -mvec3_x(axis))
	mvec3_set_x(unscaled_axis, -mvec3_x(unscaled_axis))

	return _update_rot_orig(self, axis, unscaled_axis, ...)
end