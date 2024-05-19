#整型对整型的大数相乘

#scoreboard players set input int 2147483647
#scoreboard players set input.2 int 2147483647

execute store success score #input_-1 int if score input int matches ..-1
execute store success score #input.2_-1 int if score input.2 int matches ..-1

scoreboard players operation #inp int = input int
scoreboard players operation #inp.2 int = input.2 int
execute if score #inp int matches ..-1 run scoreboard players operation #inp int *= -1 const
execute if score #inp.2 int matches ..-1 run scoreboard players operation #inp.2 int *= -1 const

execute store result score #x int store result score #y int run scoreboard players operation #z int = #inp int
scoreboard players operation #z int %= 10000 const
scoreboard players operation #y int %= 100000000 const
scoreboard players operation #y int /= 10000 const
scoreboard players operation #x int /= 100000000 const

execute store result score #a int store result score #b int run scoreboard players operation #c int = #inp.2 int
execute store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
execute store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players operation #b int /= 10000 const
execute store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #z int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #y int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #x int
scoreboard players operation #2.3 int *= #z int
scoreboard players operation #2.2 int *= #y int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #x int
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
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.1 int %= 10000 const
scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const

#调整符号
execute unless score #input_-1 int = #input.2_-1 int run function large_number:multiply_sign/multiply_unlessinput_-1iinput.2_-1_1

data modify storage large_number:math int_int_multiply.output set value [I;0,0,0,0,0]
execute store result storage large_number:math int_int_multiply.output[0] int 1.0 run scoreboard players get #4.1 int
execute store result storage large_number:math int_int_multiply.output[1] int 1.0 run scoreboard players get #4.2 int
execute store result storage large_number:math int_int_multiply.output[2] int 1.0 run scoreboard players get #4.3 int
execute store result storage large_number:math int_int_multiply.output[3] int 1.0 run scoreboard players get #4.4 int
execute store result storage large_number:math int_int_multiply.output[4] int 1.0 run scoreboard players get #4.5 int
