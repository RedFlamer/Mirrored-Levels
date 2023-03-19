local mvec3_set_x = mvector3.set_x
local mvec3_x = mvector3.x

Hooks:PreHook(FPCameraPlayerBase, "_update_rot", "mirror_update_rot", function(self, axis, unscaled_axis)
	mvec3_set_x(axis, -mvec3_x(axis))
	mvec3_set_x(unscaled_axis, -mvec3_x(unscaled_axis))
end)