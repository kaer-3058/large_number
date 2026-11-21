execute if score #loga.b.tempinp large_number.int matches 10000..3269017 store result score #loga.b.tempinte large_number.int run function large_number:loga.b/ln_inte/10000..3269017
execute if score #loga.b.tempinp large_number.int matches 3269018..2147483647 store result score #loga.b.tempinte large_number.int run function large_number:loga.b/ln_inte/3269018..2147483647

execute store result storage large_number:math temp int 0.3678794411714 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.1353352832366 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0497870683679 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0183156388887 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0067379469991 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0024787521767 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0009118819656 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0003354626279 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0001234098041 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0000453999298 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0000167017008 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0000061442124 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.0000022603294 run scoreboard players get #loga.b.tempinp large_number.int

execute store result score #loga.b.output large_number.int run function large_number:loga.b/1..10000 with storage large_number:math
scoreboard players operation #loga.b.output large_number.int %= 10000 const
scoreboard players operation #loga.b.tempinte large_number.int *= 10000 const
scoreboard players operation #loga.b.output large_number.int += #loga.b.tempinte large_number.int
