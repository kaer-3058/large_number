#执行位置需要在扫描区域的西北下角

function large_number:particle/holographic_projection/database
scoreboard players set #sstemp0 int 0
scoreboard players set #move.x int -4687
execute positioned ~ ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -4062
execute positioned ~1 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -3437
execute positioned ~2 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -2812
execute positioned ~3 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -2187
execute positioned ~4 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -1562
execute positioned ~5 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -937
execute positioned ~6 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int -312
execute positioned ~7 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 312
execute positioned ~8 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 937
execute positioned ~9 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 1562
execute positioned ~10 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 2187
execute positioned ~11 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 2812
execute positioned ~12 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 3437
execute positioned ~13 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 4062
execute positioned ~14 ~ ~ run function large_number:particle/holographic_projection/iterate
scoreboard players set #move.x int 4687
execute positioned ~15 ~ ~ run function large_number:particle/holographic_projection/iterate

tellraw @a {"translate":"large_number.holographic_projection.end","fallback":"\u00A77\u00A7o全息粒子投影：扫描完成！"}
