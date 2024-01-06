##求立方体对角线模长
#欧几里德范数
#x^2 +y^2 +z^2 ≤ 2147483647

#scoreboard players set x int 123
#scoreboard players set y int 123
#scoreboard players set z int 123

scoreboard players operation #d1.1 int = x int
scoreboard players operation #d1.2 int = y int
scoreboard players operation #d1.3 int = z int

scoreboard players operation #d1.1 int *= #d1.1 int
scoreboard players operation #d1.2 int *= #d1.2 int
scoreboard players operation #d1.3 int *= #d1.3 int
scoreboard players operation #d1.1 int += #d1.2 int
scoreboard players operation #d1.1 int += #d1.3 int

#开根号

execute store result score #6.1 int run scoreboard players operation #inp int = #d1.1 int
execute if score #d1.1 int matches 1..9 store result score #6.1 int run scoreboard players operation #inp int *= 100000000 const
execute if score #d1.1 int matches 10..999 store result score #6.1 int run scoreboard players operation #inp int *= 1000000 const
execute if score #d1.1 int matches 1000..99999 store result score #6.1 int run scoreboard players operation #inp int *= 10000 const
execute if score #d1.1 int matches 100000..9999999 store result score #6.1 int run scoreboard players operation #inp int *= 100 const

execute store result score #1.0 int store result score #1.1 int run scoreboard players operation vec_.output int = #inp int
execute if score #inp int matches 1..329475 run function large_number:simple_int_sqrt_range/int_3d_vector/0
execute if score #inp int matches 329476..18688328 run function large_number:simple_int_sqrt_range/int_3d_vector/1
execute if score #inp int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/int_3d_vector/2
execute if score #inp int matches 533610000.. run function large_number:simple_int_sqrt_range/int_3d_vector/3
scoreboard players operation #1.0 int /= vec_.output int
scoreboard players operation vec_.output int += #1.0 int
scoreboard players operation vec_.output int /= 2 const
scoreboard players operation #1.1 int /= vec_.output int
scoreboard players operation vec_.output int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation vec_.output int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #inp int run scoreboard players remove vec_.output int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #inp int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add vec_.output int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #inp int run scoreboard players remove vec_.output int 1

execute store result score #7.1 int store result score #6.5 int store result score #6.3 int store result score #6.2 int run scoreboard players get vec_.output int

#估值公式
scoreboard players operation #6.2 int *= #6.2 int
scoreboard players operation #6.1 int -= #6.2 int
scoreboard players operation #6.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
scoreboard players operation #6.1 int /= #7.1 int

execute if score #d1.1 int matches 1..9 run function large_number:int_sqrt_scb_tree/int_3d_vector/1-9
execute if score #d1.1 int matches 10..999 run function large_number:int_sqrt_scb_tree/int_3d_vector/10-999
execute if score #d1.1 int matches 1000..99999 run function large_number:int_sqrt_scb_tree/int_3d_vector/1000-99999
execute if score #d1.1 int matches 100000..9999999 run function large_number:int_sqrt_scb_tree/int_3d_vector/100000-9999999
execute if score #d1.1 int matches 10..9999999 store result score vec_.dicimal int run scoreboard players operation #6.5 int += #6.1 int

execute unless score #d1.1 int matches 1..9999999 run scoreboard players operation vec_.dicimal int = #6.1 int
