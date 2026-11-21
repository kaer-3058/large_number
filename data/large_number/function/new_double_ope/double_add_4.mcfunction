scoreboard players operation #inp large_number.int /= #double_sqrt.int_output large_number.int
execute if score #double_sqrt.int_output large_number.int > #inp large_number.int run scoreboard players remove #double_sqrt.int_output large_number.int 1

execute store result score #2N large_number.int run scoreboard players operation #N^2 large_number.int = #double_sqrt.int_output large_number.int

#估值算法
scoreboard players operation #N^2 large_number.int *= #N^2 large_number.int
scoreboard players operation #X large_number.int -= #N^2 large_number.int
scoreboard players operation #X large_number.int *= 10000 const
scoreboard players operation #2N large_number.int *= 2 const
scoreboard players add #2N large_number.int 1
scoreboard players operation #X large_number.int /= #2N large_number.int

scoreboard players operation #double_sqrt.int_output large_number.int *= 10000 const
scoreboard players operation #double_sqrt.int_output large_number.int += #X large_number.int
