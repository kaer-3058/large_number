#整型对整型的大数相乘

#scoreboard players set #input large_number.int 2147483647
#scoreboard players set #input.2 large_number.int 2147483647

execute store success score #input_-1 large_number.int if score #input large_number.int matches ..-1
execute store success score #input.2_-1 large_number.int if score #input.2 large_number.int matches ..-1

scoreboard players operation #inp large_number.int = #input large_number.int
scoreboard players operation #inp.2 large_number.int = #input.2 large_number.int
execute if score #inp large_number.int matches -2147483648 run scoreboard players set #inp large_number.int 2147483647
execute if score #inp large_number.int matches ..-1 run scoreboard players operation #inp large_number.int *= -1 const
execute if score #inp.2 large_number.int matches -2147483648 run scoreboard players set #inp.2 large_number.int 2147483647
execute if score #inp.2 large_number.int matches ..-1 run scoreboard players operation #inp.2 large_number.int *= -1 const

execute store result score #x large_number.int store result score #y large_number.int run scoreboard players operation #z large_number.int = #inp large_number.int
scoreboard players operation #z large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 100000000 const
scoreboard players operation #y large_number.int /= 10000 const
scoreboard players operation #x large_number.int /= 100000000 const

execute store result score #a large_number.int store result score #b large_number.int run scoreboard players operation #c large_number.int = #inp.2 large_number.int
execute store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players operation #c large_number.int %= 10000 const
scoreboard players operation #b large_number.int %= 100000000 const
execute store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players operation #b large_number.int /= 10000 const
execute store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players operation #a large_number.int /= 100000000 const

execute store result score #5.4 large_number.int store result score #4.5 large_number.int run scoreboard players operation #1.3 large_number.int *= #z large_number.int
execute store result score #4.4 large_number.int run scoreboard players operation #1.2 large_number.int *= #y large_number.int
execute store result score #4.3 large_number.int run scoreboard players operation #1.1 large_number.int *= #x large_number.int
scoreboard players operation #2.3 large_number.int *= #z large_number.int
scoreboard players operation #2.2 large_number.int *= #y large_number.int
execute store result score #4.2 large_number.int run scoreboard players operation #2.1 large_number.int *= #x large_number.int
scoreboard players operation #3.3 large_number.int *= #z large_number.int
scoreboard players operation #3.2 large_number.int *= #y large_number.int
execute store result score #4.1 large_number.int run scoreboard players operation #3.1 large_number.int *= #x large_number.int
scoreboard players operation #4.4 large_number.int += #2.3 large_number.int
scoreboard players operation #4.3 large_number.int += #2.2 large_number.int
scoreboard players operation #4.3 large_number.int += #3.3 large_number.int
scoreboard players operation #4.2 large_number.int += #3.2 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.1 large_number.int %= 10000 const
scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const

#调整符号
execute unless score #input_-1 large_number.int = #input.2_-1 large_number.int run function large_number:multiply_sign/multiply_unlessinput_-1iinput.2_-1_1

data modify storage large_number:math int_int_multiply.output set value [I;0,0,0,0,0]
execute store result storage large_number:math int_int_multiply.output[0] int 1.0 run scoreboard players get #4.1 large_number.int
execute store result storage large_number:math int_int_multiply.output[1] int 1.0 run scoreboard players get #4.2 large_number.int
execute store result storage large_number:math int_int_multiply.output[2] int 1.0 run scoreboard players get #4.3 large_number.int
execute store result storage large_number:math int_int_multiply.output[3] int 1.0 run scoreboard players get #4.4 large_number.int
execute store result storage large_number:math int_int_multiply.output[4] int 1.0 run scoreboard players get #4.5 large_number.int
