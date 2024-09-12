##生成一个[0,1]区间的随机数

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/start

function ntre:next
execute store result entity @s Pos[1] double .00000000023283064370807973754314699 run scoreboard players get @s ntre_output
execute at @s run tp ~ ~.5000000001164153218540398687715734 ~
data modify storage large_number:math random_number_0_1 set from entity @s Pos[1]
