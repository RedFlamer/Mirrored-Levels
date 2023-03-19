function CoreEditableGui:add_workspace(gui_object)
	local ws = self._gui:create_object_workspace(0, 0, gui_object, Vector3(0, 0, 0))
	ws:mirror_x(false) -- fuck off
	local gui = ws:panel():gui(Idstring("core/guis/core_editable_gui"))
	local panel = gui:panel()

	gui:child("std_text"):set_wrap(self._wrap)
	gui:child("std_text"):set_word_wrap(self._word_wrap)
	gui:child("std_text"):set_blend_mode(self._blend_mode)
	gui:child("std_text"):set_font(Idstring(self._font))
	gui:child("std_text"):set_text(self._text)
	gui:child("std_text"):set_render_template(Idstring(self._render_template))
	gui:child("std_text"):set_align(self._align)
	gui:child("std_text"):set_vertical(self._vertical)
	gui:child("std_text"):set_alpha(self._alpha)
	gui:child("std_text"):set_shape(self._shape[1] * gui:w(), self._shape[2] * gui:h(), self._shape[3] * gui:w(), self._shape[4] * gui:h())
	table.insert(self._guis, {
		workspace = ws,
		gui = gui,
		panel = panel
	})
end