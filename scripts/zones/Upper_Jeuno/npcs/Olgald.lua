-----------------------------------
-- Area: Upper Jeuno
--  NPC: Olgald
-- !pos -53.072 -1 103.380 244
-----------------------------------
require('scripts/globals/quests')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasCompletedQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ROAD_TO_DIVADOM) then
        player:startEvent(10167)
    elseif player:getCharVar("comebackQueenCS") == 1 then
        player:startEvent(10146)
    elseif player:getCharVar("comebackQueenCS") == 3 then
        player:startEvent(10150)
    elseif player:getCharVar("comebackQueenCS") == 5 then --player cleared Laila's story
        player:startEvent(10156)
    else
        player:startEvent(10122)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 10167 then
        player:setCharVar("dancerTailorCS", 2)
    end
end

return entity
