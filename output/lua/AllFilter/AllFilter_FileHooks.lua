Script.Load("lua/AllFilter/AllFilter.lua")

local allFilterHooked = ModLoader.SetupFileHook( "lua/menu/GUIMainMenu.lua", "lua/AllFilter/AllFilter_GUIMainMenuHooks.lua", "post" )

if not allFilterHooked then
    AllFilter.message("Failed to hook '" .. "lua/menu/GUIMainMenu.lua" .. "'")
end
