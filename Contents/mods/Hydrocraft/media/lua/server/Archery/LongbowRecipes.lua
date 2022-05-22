Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}
Recipe.OnCreate.Hydrocraft = Recipe.OnCreate.Hydrocraft or {}

-- damageMod multiplies base longbow dmg
-- breakChance chance of arrow breaking (percentage)
-- tooltip the tooltip shown in player inventory
local arrowheadStats = {
    ['Hydrocraft.HCMetalArrowhead'] = {
        damageMod = 1.3,
        breakChance = 20,
        tooltip = 'Tooltip_HCArrow_steel',
    },
    ['Hydrocraft.HCStonearrowhead'] = {
        damageMod = 1.0,
        breakChance = 40,
        tooltip = 'Tooltip_HCArrow_stone',
    },
    ['Hydrocraft.HCBonearrowhead'] = {
        damageMod = 1.1,
        breakChance = 50,
        tooltip = 'Tooltip_HCArrow_bone',
    },
    -- Failsafe, base modifiers on unknown arrowhead item
    ['Default'] = {
        damageMod = 1.0,
        breakChance = 40,
    },
}

function Recipe.OnCreate.Hydrocraft.CraftArrow(items, result, player)
    local arrowhead = items:get(1)
    local type = arrowhead:getFullType()
    local stats = arrowheadStats[type]
    if stats == nil then stats = arrowheadStats['Default']; end
    result:getModData().damageMod = stats.damageMod
    result:getModData().breakChance = stats.breakChance
    result:getModData().tooltip = stats.tooltip
    result:setTooltip(stats.tooltip)
end
