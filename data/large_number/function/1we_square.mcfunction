#12位数字平方

execute store result score #c large_number.int run data get storage large_number:math 1we_squ.input[2]
execute store result score #b large_number.int run data get storage large_number:math 1we_squ.input[1]
execute store result score #a large_number.int run data get storage large_number:math 1we_squ.input[0]

execute if score #c large_number.int matches ..-1 run scoreboard players operation #c large_number.int *= -1 const
execute if score #b large_number.int matches ..-1 run scoreboard players operation #b large_number.int *= -1 const
execute if score #a large_number.int matches ..-1 run scoreboard players operation #a large_number.int *= -1 const

execute store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players get #c large_number.int
execute store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players get #b large_number.int
execute store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players get #a large_number.int

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
execute store result score #5.0 large_number.int run scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

data modify storage large_number:math 1we_squ.output set value [I;0,0,0,0,0,0]
execute store result storage large_number:math 1we_squ.output[0] int 1.0 run scoreboard players operation #5.0 large_number.int /= 10000 const
execute store result storage large_number:math 1we_squ.output[1] int 1.0 run scoreboard players operation #4.1 large_number.int %= 10000 const
execute store result storage large_number:math 1we_squ.output[2] int 1.0 run scoreboard players operation #4.2 large_number.int %= 10000 const
execute store result storage large_number:math 1we_squ.output[3] int 1.0 run scoreboard players operation #4.3 large_number.int %= 10000 const
execute store result storage large_number:math 1we_squ.output[4] int 1.0 run scoreboard players operation #4.4 large_number.int %= 10000 const
execute store result storage large_number:math 1we_squ.output[5] int 1.0 run scoreboard players operation #4.5 large_number.int %= 10000 const
