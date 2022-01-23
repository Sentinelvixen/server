-----------------------------------
-- Inspirit
-- Restores HP to nearby allies.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.SELF_HEAL)

    -- Todo: verify/correct maths
    return xi.mobskills.mobHealMove(mob, math.floor(mob:getHP() / 7) * 2)
end

return mobskill_object
