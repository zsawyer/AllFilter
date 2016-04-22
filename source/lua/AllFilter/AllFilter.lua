
AllFilter = { }
AllFilter.debugging = false

AllFilter.modName = "AllFilterAsDefault"
AllFilter.build = "b0005"
AllFilter.msgPrefix = "[" .. AllFilter.modName .. "] "
AllFilter.infoText = "not initialized"

function AllFilter.message(message)
    Shared.Message(AllFilter.msgPrefix .. message)
end

function AllFilter.debug(message)
    if AllFilter.debugging then
        AllFilter.message(message)
    end
end

function AllFilter.version()
    AllFilter.debug("debugging enabled")
    AllFilter.message("initialized (build " .. AllFilter.build .. ")")
end

AllFilter.version()
