function HUDHitDirection:_animate(indicator, data, remove_func)
	data.t = data.duration
	data.col_start = 0.7
	data.col = 0.4

	while data.t > 0 do
		local dt = coroutine.yield()
		data.t = data.t - dt
		data.col = math.clamp(data.col - dt, 0, 1)

		if alive(indicator) then
			indicator:set_color(self:_get_indicator_color(data.damage_type, data.col / data.col_start))
			indicator:set_alpha(data.t / data.duration)

			if managers.player:player_unit() then
				local ply_camera = managers.player:player_unit():camera()

				if ply_camera then
					local target_vec = ply_camera:position() - data.origin
					local angle = -target_vec:to_polar_with_reference(ply_camera:forward(), math.UP).spin
					local r = HUDHitDirection.PANEL_SIZE * 0.4

					if data.fixed_angle ~= nil then
						angle = -data.fixed_angle
					end

					indicator:set_rotation(90 - angle)
					indicator:set_center(HUDHitDirection.PANEL_SIZE * 0.5 - math.sin(angle + 180) * r, HUDHitDirection.PANEL_SIZE * 0.5 - math.cos(angle + 180) * r)
				end
			end
		end
	end

	remove_func(indicator, data)
end