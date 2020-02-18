----------------------------------------------
------ Duplicated from RemotePlayer.lua ------
----------------------------------------------

local function TableAlreadyContains(tbl, entry)
	for _, value in pairs(tbl) do
		if value[1] == entry[1] and value[2] == entry[2] then
			return true
		end
	end
	return false
end

local function LearnCodex(itemName)
	local existingKnownEntries = player.getProperty("xcodex.knownCodexEntries") or {}
	local data = root.itemConfig(itemName)		
	if itemName:sub(-6) ~= "-codex" then
		if sb then sb.logWarn("Player attempted to learn codex, but held item name did not end in -codex! This could cause serious issues!") end
	else
		itemName = itemName:sub(1, -7)
	end
	
	-- This is for sanity checking. The interface itself will actually remove null codex entries from player data persistence.
	local codexCache = {tostring(itemName), tostring(data.directory)}
	
	-- If our internal cache here says we don't know it then we need to learn it.
	if not TableAlreadyContains(existingKnownEntries, codexCache) then
		table.insert(existingKnownEntries, codexCache)
		player.setProperty("xcodex.knownCodexEntries", existingKnownEntries)
		if sb then sb.logInfo("Player has learned codex " .. table.concat(codexCache, ", ") .. ".") end
	else
		if sb then sb.logInfo("Player attempted to learn codex " .. table.concat(codexCache, ", ") .. " but they already know it in the new registry.") end
	end
end

----------------------------------------------
----------------------------------------------
----------------------------------------------

function CodexButtonClicked()
	--player.interact("ScriptPane", "/interface/scripted/xcustomcodex/xcodexui.config", player.id())
	local items = widget.itemGridItems("itemGrid")
	for index, item in pairs(items) do
		local itemName = item.name
		 if itemName:sub(-6) == "-codex" then
			LearnCodex(itemName)
		 end
	end
	widget.playSound("/sfx/interface/item_equip.ogg") -- Give the player some feedback that they learned the entries.
end

-- gg ez