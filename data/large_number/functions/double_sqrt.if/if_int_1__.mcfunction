execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #temp2 int run scoreboard players operation #d1.1 int = #ds1.0 int
execute if score #d1.1 int matches 0..1515359 run scoreboard players operation #temp2 int /= 559 const
execute if score #d1.1 int matches 0..1515359 run scoreboard players add #temp2 int 15
execute if score #d1.1 int matches 1515360.. run scoreboard players operation #temp2 int /= 32768 const
execute if score #d1.1 int matches 1515360.. run scoreboard players add #temp2 int 2456
scoreboard players operation #t1 int /= #temp2 int
scoreboard players operation #temp2 int += #t1 int
scoreboard players operation #temp2 int /= 2 const
scoreboard players operation #t2 int /= #temp2 int
scoreboard players operation #temp2 int += #t2 int
scoreboard players operation #temp2 int /= 2 const
scoreboard players operation #t3 int /= #temp2 int
scoreboard players operation #temp2 int += #t3 int
scoreboard players operation #temp2 int /= 2 const
scoreboard players operation #d1.1 int /= #temp2 int
execute if score #temp2 int > #d1.1 int run scoreboard players remove #temp2 int 1

execute if score #temp2 int matches 0..9 store result storage large_number:math double_sqrt.output.double double 0.0000001 run scoreboard players get #d2.1 int
execute if score #temp2 int matches 10..99 store result storage large_number:math double_sqrt.output.double double 0.000001 run scoreboard players get #d2.1 int
execute if score #temp2 int matches 100..999 store result storage large_number:math double_sqrt.output.double double 0.00001 run scoreboard players get #d2.1 int
execute if score #temp2 int matches 1000..9999 store result storage large_number:math double_sqrt.output.double double 0.0001 run scoreboard players get #d2.1 int
