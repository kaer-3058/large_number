execute store result entity @s Pos[1] double .0001 run scoreboard players remove #n int 20000

scoreboard players operation #n int *= #n int
scoreboard players operation #n int *= -1 const

##简易开根
execute store result score #t1 int store result score #t2 int store result score #rn.length int run scoreboard players add #n int 400000000
execute if score #n int matches 0..1515359 run scoreboard players operation #rn.length int /= 559 const
execute if score #n int matches 0..1515359 run scoreboard players add #rn.length int 15
execute if score #n int matches 1515360.. run scoreboard players operation #rn.length int /= 32768 const
execute if score #n int matches 1515360.. run scoreboard players add #rn.length int 2456
scoreboard players operation #t1 int /= #rn.length int
scoreboard players operation #rn.length int += #t1 int
scoreboard players operation #rn.length int /= 2 const
scoreboard players operation #t2 int /= #rn.length int
scoreboard players operation #rn.length int += #t2 int
scoreboard players operation #rn.length int /= 2 const
scoreboard players operation #n int /= #rn.length int
scoreboard players operation #rn.length int += #n int
scoreboard players operation #rn.length int /= 2 const

execute store result storage large_number:math temp_r double .0001 run scoreboard players get #rn.length int

data modify storage large_number:math s0 set from entity @s Pos
data modify storage large_number:math s1 set from entity @s Rotation
execute at @s run function large_number:particle/3d_hsphere/macro1 with storage large_number:math
execute positioned .0 .0 .0 facing entity @s feet run function large_number:particle/3d_hsphere/macro2 with storage large_number:math
data modify storage large_number:math 3d_hsphere_pos append from entity @s Pos

data modify entity @s Pos set from storage large_number:math s0
data modify entity @s Rotation set from storage large_number:math s1
execute at @s run tp @s ~ ~ ~ ~222.49223594996214535365126037162 ~

execute store result score #n int run scoreboard players operation #loop int += #temp_any_fen int
execute if score #loop int matches ..40000 run function large_number:particle/3d_hsphere/loop
