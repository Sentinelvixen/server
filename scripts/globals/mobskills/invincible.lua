-----------------------------------
-- Invincible
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    xi.mobskills.mobBuffMove(mob, xi.effect.INVINCIBLE, 1, 0, 30)

    skill:setMsg(xi.msg.basic.USES)

    return xi.effect.INVINCIBLE
end

return mobskill_object
