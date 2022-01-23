-----------------------------------
-- Area: Port Jeuno
--  NPC: Joachim
-- !pos -52.844 0.000 -9.978 246
-- CS/Event ID's:
-- 324 = on zoning in
-- 325 = 1st chat, get 1st stone,
-- completes "A Journey Begins"
-- 326 = Limited Menu
-- 327 = CS after "The Truth Beckons" completed.
-- 328 = Full Menu
-- 331 = CS after "Dawn of Death" completed.
-- 332 =
-- 333 =
-- 334 =
-- 335 =
-- 336 =
-- 337 =
-- 338 =
-- 339 =
-- 340 =
-- 341 =
-- 342 =
-- 343 =
-- 344 =
-- 345 =
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/abyssea")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
-- TODO: logic to increase traverser stone count...Based on time between 2 vars?
    local StonesStock = player:getCurrency("traverser_stones")
    local StonesKI    = xi.abyssea.getTravStonesTotal(player)
    local MaxKI       = xi.abyssea.getMaxTravStones(player)
    local isCap       = 0

    if StonesKI >= MaxKI then
        isCap = 1
    end

    if player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.A_JOURNEY_BEGINS) == QUEST_ACCEPTED then
        player:startEvent(325)

    elseif
        player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and
        player:getCharVar("1stTimeAbyssea") == 1
    then
        player:startEvent(327, 0, 0, MaxKI) -- cs for "The Truth Beckons" completion

    elseif player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS) ~= QUEST_COMPLETED then
        player:startEvent(326) -- Pre "The Truth Beckons" Menu

    elseif player:getQuestStatus(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DAWN_OF_DEATH) == QUEST_ACCEPTED then
        player:startEvent(328, 0, StonesStock, StonesKI, isCap, 1, 1, 1, 3) -- Post "The Truth Beckons" Menu
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 325 then
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE1)
        player:addKeyItem(xi.ki.TRAVERSER_STONE1)
        player:completeQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.A_JOURNEY_BEGINS)
        player:addQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS)
    elseif csid == 327 then
        player:completeQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.THE_TRUTH_BECKONS)
        player:addQuest(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DAWN_OF_DEATH)
        player:setCharVar("1stTimeAbyssea", 0)
    elseif csid == 328 and option == 6 then
        local StonesKI = xi.abyssea.getTravStonesTotal(player)
        if StonesKI == 5 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE6)
            player:addKeyItem(xi.ki.TRAVERSER_STONE6)
        elseif StonesKI == 4 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE5)
            player:addKeyItem(xi.ki.TRAVERSER_STONE5)
        elseif StonesKI == 3 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE4)
            player:addKeyItem(xi.ki.TRAVERSER_STONE4)
        elseif StonesKI == 2 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE3)
            player:addKeyItem(xi.ki.TRAVERSER_STONE3)
        elseif StonesKI == 1 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE2)
            player:addKeyItem(xi.ki.TRAVERSER_STONE2)
        elseif StonesKI == 0 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TRAVERSER_STONE1)
            player:addKeyItem(xi.ki.TRAVERSER_STONE1)
        end
    end
end

return entity
