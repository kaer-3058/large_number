execute store result entity @s Pos[1] double .0001 run scoreboard players remove #n large_number.int 20000

scoreboard players operation #n large_number.int *= #n large_number.int
scoreboard players operation #n large_number.int *= -1 const

##简易开根
execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #rn.length large_number.int run scoreboard players add #n large_number.int 400000000
execute if score #n large_number.int matches 0..1515359 run scoreboard players operation #rn.length large_number.int /= 559 const
execute if score #n large_number.int matches 0..1515359 run scoreboard players add #rn.length large_number.int 15
execute if score #n large_number.int matches 1515360.. run scoreboard players operation #rn.length large_number.int /= 32768 const
execute if score #n large_number.int matches 1515360.. run scoreboard players add #rn.length large_number.int 2456
scoreboard players operation #t1 large_number.int /= #rn.length large_number.int
scoreboard players operation #rn.length large_number.int += #t1 large_number.int
scoreboard players operation #rn.length large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #rn.length large_number.int
scoreboard players operation #rn.length large_number.int += #t2 large_number.int
scoreboard players operation #rn.length large_number.int /= 2 const
scoreboard players operation #n large_number.int /= #rn.length large_number.int
scoreboard players operation #rn.length large_number.int += #n large_number.int
execute store result storage large_number:math temp_r double .0001 run scoreboard players operation #rn.length large_number.int /= 2 const

execute at @s run function large_number:particle/3d_hsphere/2

execute store result score #n large_number.int run scoreboard players operation #loop large_number.int += #temp_any_fen large_number.int
execute if score #loop large_number.int matches ..40000 run function large_number:particle/3d_hsphere/loop
