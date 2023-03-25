local math_up = math.UP

local mrot_lookat = mrotation.set_look_at
local mrot_set = mrotation.set_yaw_pitch_roll

local mvec3_add = mvector3.add
local mvec3_rot = mvector3.rotate_with
local mvec3_set_x = mvector3.set_x
local mvec3_sub = mvector3.subtract
local mvec3_x = mvector3.x

local tmp_rot1 = Rotation()

local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

Hooks:PreHook(PlayerDamage, "_hit_direction", "mirror_hit_direction", function(self, position_vector, direction_vector)
	mvec3_set_x(direction_vector, -mvec3_x(direction_vector))
end)