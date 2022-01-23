-----------------------------------
-- ID: 20568
-- wind_knife_+1
-- Enchantment: Casts Aero
-----------------------------------
require("scripts/globals/spell_data")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(user, target)
    -- user:castSpell(xi.magic.spell.AERO, target)
    user:PrintToPlayer("Wind Knife +1 : enchantment implementation untested.")
end

return item_object
