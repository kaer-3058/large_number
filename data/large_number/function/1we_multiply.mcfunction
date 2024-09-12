# 1万亿以内的数*1万亿以内的数

#data modify storage large_number:math 1we_multiply.input1 set value [I;9999,9999,9999]
#data modify storage large_number:math 1we_multiply.input2 set value [I;9999,9999,9999]

execute store result score #x int run data get storage large_number:math 1we_multiply.input1[0]
execute store result score #y int run data get storage large_number:math 1we_multiply.input1[1]
execute store result score #z int run data get storage large_number:math 1we_multiply.input1[2]

execute store result score #a int run data get storage large_number:math 1we_multiply.input2[0]
execute store result score #b int run data get storage large_number:math 1we_multiply.input2[1]
execute store result score #c int run data get storage large_number:math 1we_multiply.input2[2]

scoreboard players set #input_-1 int 0
scoreboard players set #input.2_-1 int 0
execute store success score #input_-1 int if score #x int matches ..-1 run scoreboard players operation #x int *= -1 const
execute store success score #input_-1 int if score #y int matches ..-1 run scoreboard players operation #y int *= -1 const
execute store success score #input_-1 int if score #z int matches ..-1 run scoreboard players operation #z int *= -1 const
execute store success score #input.2_-1 int if score #a int matches ..-1 run scoreboard players operation #a int *= -1 const
execute store success score #input.2_-1 int if score #b int matches ..-1 run scoreboard players operation #b int *= -1 const
execute store success score #input.2_-1 int if score #c int matches ..-1 run scoreboard players operation #c int *= -1 const

execute store result score #1.1 int store result score #1.2 int run scoreboard players operation #1.3 int = #c int
execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #z int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #y int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #x int
execute store result score #2.1 int store result score #2.2 int run scoreboard players operation #2.3 int = #b int
scoreboard players operation #2.3 int *= #z int
scoreboard players operation #2.2 int *= #y int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #x int
execute store result score #3.1 int store result score #3.2 int run scoreboard players operation #3.3 int = #a int
scoreboard players operation #3.3 int *= #z int
scoreboard players operation #3.2 int *= #y int
execute store result score #4.1 int run scoreboard players operation #3.1 int *= #x int
scoreboard players operation #4.4 int += #2.3 int
scoreboard players operation #4.3 int += #2.2 int
scoreboard players operation #4.3 int += #3.3 int
scoreboard players operation #4.2 int += #3.2 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #4.1 int += #5.1 int
scoreboard players operation #4.0 int /= 10000 const

scoreboard players operation #4.1 int %= 10000 const
scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const

#调整符号
execute unless score #input_-1 int = #input.2_-1 int run function large_number:multiply_sign/multiply_unlessinput_-1iinput.2_-1_2

data modify storage large_number:math 1we_multiply.output set value [I;0,0,0,0,0,0]
execute store result storage large_number:math 1we_multiply.output[0] int 1.0 run scoreboard players get #4.0 int
execute store result storage large_number:math 1we_multiply.output[1] int 1.0 run scoreboard players get #4.1 int
execute store result storage large_number:math 1we_multiply.output[2] int 1.0 run scoreboard players get #4.2 int
execute store result storage large_number:math 1we_multiply.output[3] int 1.0 run scoreboard players get #4.3 int
execute store result storage large_number:math 1we_multiply.output[4] int 1.0 run scoreboard players get #4.4 int
execute store result storage large_number:math 1we_multiply.output[5] int 1.0 run scoreboard players get #4.5 int
