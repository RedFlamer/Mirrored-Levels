local mvec3_set_x = mvector3.set_x
local mvec3_x = mvector3.x

Hooks:PreHook(HUDAccessCamera, "draw_marker", "mirror_draw_marker", function(self, i, pos)
	mvec3_set_x(pos, self._full_hud_panel:width() - mvec3_x(pos)) -- HACK, workspace is mirrored so unmirror the input position
end)