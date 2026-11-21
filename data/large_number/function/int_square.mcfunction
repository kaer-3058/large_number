##整数平方

scoreboard players operation #c large_number.int = #input large_number.int
execute if score #c large_number.int matches -2147483648 run scoreboard players set #c large_number.int 2147483647
execute if score #c large_number.int matches ..-1 run scoreboard players operation #c large_number.int *= -1 const
execute store result score #a large_number.int run scoreboard players operation #b large_number.int = #c large_number.int
execute store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players operation #c large_number.int %= 10000 const
scoreboard players operation #b large_number.int %= 100000000 const
execute store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players operation #b large_number.int /= 10000 const
execute store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players operation #a large_number.int /= 100000000 const

execute store result score #5.4 large_number.int store result score #4.5 large_number.int run scoreboard players operation #1.3 large_number.int *= #c large_number.int
execute store result score #4.4 large_number.int run scoreboard players operation #1.2 large_number.int *= #b large_number.int
execute store result score #4.3 large_number.int run scoreboard players operation #1.1 large_number.int *= #a large_number.int
scoreboard players operation #2.3 large_number.int *= #c large_number.int
scoreboard players operation #2.2 large_number.int *= #b large_number.int
execute store result score #4.2 large_number.int run scoreboard players operation #2.1 large_number.int *= #a large_number.int
scoreboard players operation #3.3 large_number.int *= #c large_number.int
scoreboard players operation #3.2 large_number.int *= #b large_number.int
execute store result score #4.1 large_number.int run scoreboard players operation #3.1 large_number.int *= #a large_number.int
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

data modify storage large_number:math int_squ set value [I;0,0,0,0,0]
execute store result storage large_number:math int_squ[0] int 1.0 run scoreboard players operation #4.1 large_number.int %= 10000 const
execute store result storage large_number:math int_squ[1] int 1.0 run scoreboard players operation #4.2 large_number.int %= 10000 const
execute store result storage large_number:math int_squ[2] int 1.0 run scoreboard players operation #4.3 large_number.int %= 10000 const
execute store result storage large_number:math int_squ[3] int 1.0 run scoreboard players operation #4.4 large_number.int %= 10000 const
execute store result storage large_number:math int_squ[4] int 1.0 run scoreboard players operation #4.5 large_number.int %= 10000 const
