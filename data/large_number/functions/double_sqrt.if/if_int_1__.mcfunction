execute store result score #1.0 int store result score #1.1 int store result score #d2.1 int run scoreboard players operation #d1.1 int = #ds1.0 int
execute if score #d1.1 int matches 1..329475 run function large_number:simple_int_sqrt_range/large_sqrt_2/0
execute if score #d1.1 int matches 329476..18688328 run function large_number:simple_int_sqrt_range/large_sqrt_2/1
execute if score #d1.1 int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/large_sqrt_2/2
execute if score #d1.1 int matches 533610000.. run function large_number:simple_int_sqrt_range/large_sqrt_2/3
scoreboard players operation #1.0 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.0 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.1 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation #d2.1 int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #d1.1 int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add #d2.1 int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1

execute if score #d2.1 int matches 0..9 store result storage math double_sqrt.output.double double 0.0000001 run scoreboard players get #ds2.1 int
execute if score #d2.1 int matches 10..99 store result storage math double_sqrt.output.double double 0.000001 run scoreboard players get #ds2.1 int
execute if score #d2.1 int matches 100..999 store result storage math double_sqrt.output.double double 0.00001 run scoreboard players get #ds2.1 int
execute if score #d2.1 int matches 1000..9999 store result storage math double_sqrt.output.double double 0.0001 run scoreboard players get #ds2.1 int
