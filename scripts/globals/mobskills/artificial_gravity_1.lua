-----------------------------------
-- Artifical Gravity w/ Single gear
-- Damage plus Weight effect
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 15, 0, 60)
    target:delHP(dmg)
    return dmg
end

return mobskill_object
