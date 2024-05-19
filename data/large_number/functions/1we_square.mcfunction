#12位数字平方

execute store result score #c int run data get storage large_number:math 1we_squ.input[2]
execute store result score #b int run data get storage large_number:math 1we_squ.input[1]
execute store result score #a int run data get storage large_number:math 1we_squ.input[0]

execute if score #c int matches ..-1 run scoreboard players operation #c int *= -1 const
execute if score #b int matches ..-1 run scoreboard players operation #b int *= -1 const
execute if score #a int matches ..-1 run scoreboard players operation #a int *= -1 const

execute store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players get #c int
execute store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players get #b int
execute store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players get #a int

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
execute store result score #5.0 int run scoreboard players operation #4.1 int += #5.1 int

data modify storage large_number:math 1we_squ.output set value [I;0,0,0,0,0,0]
execute store result storage large_number:math 1we_squ.output[0] int 1.0 run scoreboard players operation #5.0 int /= 10000 const
execute store result storage large_number:math 1we_squ.output[1] int 1.0 run scoreboard players operation #4.1 int %= 10000 const
execute store result storage large_number:math 1we_squ.output[2] int 1.0 run scoreboard players operation #4.2 int %= 10000 const
execute store result storage large_number:math 1we_squ.output[3] int 1.0 run scoreboard players operation #4.3 int %= 10000 const
execute store result storage large_number:math 1we_squ.output[4] int 1.0 run scoreboard players operation #4.4 int %= 10000 const
execute store result storage large_number:math 1we_squ.output[5] int 1.0 run scoreboard players operation #4.5 int %= 10000 const
