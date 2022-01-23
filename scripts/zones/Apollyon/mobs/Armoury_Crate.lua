-----------------------------------
-- Area: Apollyon SW
--  Mob: Armoury Crate
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/status")
require("scripts/globals/limbus")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    --mob:setMobMod(xi.mobMod.DRAW_IN, 2) -- need to set a maximum distance for draw-in
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetNPCByID(ID.npc.APOLLYON_SW_PORTAL[3]):getAnimation() ~= xi.animation.OPEN_DOOR then
            xi.limbus.handleDoors(mob:getBattlefield(), true, ID.npc.APOLLYON_SW_PORTAL[3])
        end
    end
end

entity.onMobDespawn = function(mob)
    if mob:getBattlefield() then
        local mobID        = mob:getID()
        local mimicSpawned = mob:getBattlefield():getLocalVar("mimicSpawned")

        if mobID == ID.mob.APOLLYON_SW_MOB[3] then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-1)
        elseif mobID == ID.mob.APOLLYON_SW_MOB[3] + 1 then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-2)
        elseif mobID == ID.mob.APOLLYON_SW_MOB[3] + 2 then
            mob:getBattlefield():setLocalVar("mimicSpawned", mimicSpawned-4)
        end
    end
end

return entity
