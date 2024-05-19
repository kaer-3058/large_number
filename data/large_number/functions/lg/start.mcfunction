##常用对数 lg(x)
#lg(x) = ln(x)/ln(10)

scoreboard players operation #loga.b.tempinp int = #lg(x) int
execute if score #loga.b.tempinp int matches 1..10000 store result storage large_number:math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage large_number:math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

execute store result storage large_number:math lg(x)_output double 0.4342944819033 run scoreboard players get #loga.b.output int
execute store result score #lg(x)_output int run data get storage large_number:math lg(x)_output

#这些数是10的整数次幂
execute if score #lg(x) int matches 10 run scoreboard players set #lg(x)_output int 10000
execute if score #lg(x) int matches 100 run scoreboard players set #lg(x)_output int 20000
execute if score #lg(x) int matches 1000 run scoreboard players set #lg(x)_output int 30000
execute if score #lg(x) int matches 10000 run scoreboard players set #lg(x)_output int 40000
execute if score #lg(x) int matches 100000 run scoreboard players set #lg(x)_output int 50000
execute if score #lg(x) int matches 1000000 run scoreboard players set #lg(x)_output int 60000
execute if score #lg(x) int matches 10000000 run scoreboard players set #lg(x)_output int 70000
execute if score #lg(x) int matches 100000000 run scoreboard players set #lg(x)_output int 80000
execute if score #lg(x) int matches 1000000000 run scoreboard players set #lg(x)_output int 90000

execute store result storage large_number:math lg(x)_output double 0.0001 run scoreboard players get #lg(x)_output int
