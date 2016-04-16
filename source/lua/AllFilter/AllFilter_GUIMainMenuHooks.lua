AllFilter.debug("hooking into GUIMainMenu...")

local originalInitialize = GUIMainMenu.Initialize
function GUIMainMenu:Initialize()
    AllFilter.debug("hooked into GUIMainMenu.Initialize method")
    
    AllFilter.init()

    -- call the super method
    originalInitialize(self);
end


local originalCreateServerListWindow = GUIMainMenu.CreateServerListWindow
function GUIMainMenu:CreateServerListWindow()
    AllFilter.debug("hooked into GUIMainMenu.CreateServerListWindow method")
    
    -- call the super method
    originalCreateServerListWindow(self)

    AllFilter.message("setting ALL filter")
    self.serverList:SetFilter(1, FilterServerMode(""))
    self.serverTabs.selectedTab = "ALL"
end

AllFilter.debug("done hooking into GUIMainMenu.")