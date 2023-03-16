Hooks:Add("LocalizationManagerPostInit", "AddContourLocList", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_contour_pdth"] = "PDTH"
    })	
end)

if BLT.Mods:GetModByName("Contour Style Selector") then
    table.insert(tweak_data.contour_styles, 
        {
            value = "contour_pdth",
            text_id = "menu_contour_pdth"		
        }
    )
end