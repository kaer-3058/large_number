scoreboard players operation #inp int /= #double_sqrt.int_output int
execute if score #double_sqrt.int_output int > #inp int run scoreboard players remove #double_sqrt.int_output int 1

execute store result score #2N int run scoreboard players operation #N^2 int = #double_sqrt.int_output int

#估值算法
scoreboard players operation #N^2 int *= #N^2 int
scoreboard players operation #X int -= #N^2 int
scoreboard players operation #X int *= 10000 const
scoreboard players operation #2N int *= 2 const
scoreboard players add #2N int 1
scoreboard players operation #X int /= #2N int

scoreboard players operation #double_sqrt.int_output int *= 10000 const
scoreboard players operation #double_sqrt.int_output int += #X int
