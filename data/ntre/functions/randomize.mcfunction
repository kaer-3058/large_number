execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:[ntre_randomizer]}
execute store result score @s ntre_seed_high run data get entity @e[tag=ntre_randomizer,limit=1] UUID[0]
execute store result score @s ntre_seed_low32 run data get entity @e[tag=ntre_randomizer,limit=1] UUID[3]

function ntre:reset
