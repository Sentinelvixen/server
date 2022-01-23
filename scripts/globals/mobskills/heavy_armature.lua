-----------------------------------
-- Heavy Armature
-- Adds buffs Haste, Shell, Protect, Blink
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if mob:getPool() == 243 then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    -- Not much info on how much haste this gives. Supposed to be "high". Went with Magic Haste Cap
    xi.mobskills.mobBuffMove(mob, xi.effect.HASTE, 4375, 0, 180)
    xi.mobskills.mobBuffMove(mob, xi.effect.PROTECT, 100, 0, 180)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.BLINK, math.random(10, 25), 0, 120))

    return xi.effect.BLINK
end

return mobskill_object
