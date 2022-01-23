-----------------------------------
-- Area: Apollyon NE
--  Mob: Hyperion
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/limbus")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.UDMGMAGIC, -10000)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobID       = mob:getID()
        local battlefield = mob:getBattlefield()
        local randomF4    = battlefield:getLocalVar("randomF4")

        if randomF4 == mobID then
            xi.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NE_PORTAL[4])
        end
    end
end

return entity
