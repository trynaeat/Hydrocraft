local MOD_ID = "HydroCombat";


local function HydroCombatOnHitZombie(zombie,player,bodyType,weapon)
	local weaponName = ""
	if(weapon ~= nil) then
		weaponName = weapon:getType()
	else
		weaponName = "This should never happen, but if it does weaponName still needs some text in it" -- :D
	end
	
	if(weaponName == "HCLongbow") then
		-- base 60% chance of getting arrow back
		local chance = weapon:getModData().shotArrow.breakChance or 40
		local damage = weapon:getMaxDamage()
		print('Break chance: ' .. chance)
		print('Max damage: ' .. damage)

		local getArrowBack = (ZombRand(100) > chance - 1)
		if(not getArrowBack) then
			return
		end
		local newArrow = InventoryItemFactory.CreateItem("Hydrocraft.HCArrow")
		-- Copy all moddata to the new arrow
		for k, v in pairs(weapon:getModData().shotArrow) do
			newArrow:getModData()[k] = v
		end
		zombie:addItemToSpawnAtDeath(newArrow)
	elseif(weaponName == "HCLongbowMag") then
		local getArrowBack = (ZombRand(5) > 1) --60% chance of getting the arrow back
		if(not getArrowBack) then
			return
		end
		zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCArrow"))
	elseif(weaponName == "HCCrossbow") then
		local getArrowBack = (ZombRand(5) > 1) --60% chance of getting the arrow back
		if(not getArrowBack) then
			return
		end
		zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCXbowbolt"))
	end
end


Events.OnHitZombie.Add(HydroCombatOnHitZombie);
