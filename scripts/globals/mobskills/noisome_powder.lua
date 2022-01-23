-----------------------------------
-- Noisome Powder
-- Reduces attack of targets in area of effect.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
        return 0
    else
        return 1
    end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.ATTACK_DOWN
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 40, 0, 120))

    return typeEffect
end

return mobskill_object
