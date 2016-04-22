local hookTarget = "ServerTabs"
AllFilter.debug("hooking into " .. hookTarget .. "...")

local counter = 0

local function GetFiltersByTabName(name, definitions)

    for _, tabDef in ipairs(definitions) do
    
        if tabDef.name == name then
            return tabDef.filters
        end
    
    end
    
    return {}

end


local originalInitialize = ServerTabs.Initialize
function ServerTabs:Initialize()
    AllFilter.debug("hooked into ServerTabs.Initialize method")
    
    -- call the super method
    originalInitialize(self)
    
    Client.SetOptionString("currentGameModeFilter", "ALL")
end


local originalReset = ServerTabs.Reset
function ServerTabs:Reset()
    AllFilter.debug("hooked into ServerTabs.Reset method")
    
    -- call the super method
    originalReset(self)
    
    Client.SetOptionString("currentGameModeFilter", "ALL")
end

local originalSetGameTypes = ServerTabs.SetGameTypes
function ServerTabs:SetGameTypes(gameTypes)
    AllFilter.debug("hooked into ServerTabs.SetGameTypes method")

    -- call the super method
    originalSetGameTypes(self, gameTypes);
    
    local currentGameModeFilter = Client.GetOptionString("currentGameModeFilter", "ALL")
    self:SelectTab(currentGameModeFilter)

    --self:Render()
end


local originalSelectTab = ServerTabs.SelectTab
function ServerTabs:SelectTab(name)
    AllFilter.debug("hooked into ServerTabs.SelectTab method (" .. counter .. ")")
    counter = counter + 1
    -- call the super method
    originalSelectTab(self, name)
    
    
    local filters = GetFiltersByTabName(name, self.layout)

    --If we couldn't find any tab for given name default back to all
    if not filters then
        AllFilter.debug("no filters found for " .. name)
        filters = { [1] = FilterServerMode(""), [8] = FilterFavoriteOnly(false), [11] = FilterHistoryOnly(false) }
        name = "ALL"
    end

    self:EnableFilter(filters)
    self.selectedTab = name
    self:UpdateTabSelector()
end

AllFilter.debug("done hooking into " .. hookTarget .. ".")
