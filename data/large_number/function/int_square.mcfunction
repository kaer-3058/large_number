##整数平方

scoreboard players operation #c int = input int
execute if score #c int matches -2147483648 run scoreboard players set #c int 2147483647
execute if score #c int matches ..-1 run scoreboard players operation #c int *= -1 const
execute store result score #a int run scoreboard players operation #b int = #c int
execute store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
execute store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players operation #b int /= 10000 const
execute store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #c int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #b int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #a int
scoreboard players operation #2.3 int *= #c int
scoreboard players operation #2.2 int *= #b int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #a int
scoreboard players operation #3.3 int *= #c int
scoreboard players operation #3.2 int *= #b int
execute store result score #4.1 int run scoreboard players operation #3.1 int *= #a int
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

data modify storage large_number:math int_squ set value [I;0,0,0,0,0]
execute store result storage large_number:math int_squ[0] int 1.0 run scoreboard players operation #4.1 int %= 10000 const
execute store result storage large_number:math int_squ[1] int 1.0 run scoreboard players operation #4.2 int %= 10000 const
execute store result storage large_number:math int_squ[2] int 1.0 run scoreboard players operation #4.3 int %= 10000 const
execute store result storage large_number:math int_squ[3] int 1.0 run scoreboard players operation #4.4 int %= 10000 const
execute store result storage large_number:math int_squ[4] int 1.0 run scoreboard players operation #4.5 int %= 10000 const
