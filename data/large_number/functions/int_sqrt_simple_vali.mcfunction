execute store result score #1.0 int store result score #1.1 int run scoreboard players operation output.sqrt int = input.sqrt int
execute if score input.sqrt int matches 1..329475 run function large_number:simple_int_sqrt_range/0
execute if score input.sqrt int matches 329476..18688328 run function large_number:simple_int_sqrt_range/1
execute if score input.sqrt int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/2
execute if score input.sqrt int matches 533610000.. run function large_number:simple_int_sqrt_range/3
scoreboard players operation #1.0 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.0 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #1.1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation output.sqrt int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > input.sqrt int run scoreboard players remove output.sqrt int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < input.sqrt int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add output.sqrt int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > input.sqrt int run scoreboard players remove output.sqrt int 1
