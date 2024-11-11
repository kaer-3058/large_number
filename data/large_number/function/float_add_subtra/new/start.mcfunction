##浮点数加减法 - 计分板算法

#载入数2
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_add_subtra.input2
function large_number:float_nbt_to_score/start
scoreboard players operation #Divisor_float_sign int = #float_sign int
scoreboard players operation #Divisor_float_exp int = #float_exp int
scoreboard players operation #Divisor_float_int0 int = #float_int0 int

#载入数1
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_add_subtra.input1
function large_number:float_nbt_to_score/start

#数位对齐
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players operation #float_int0 int /= 10 const
execute if score #float_exp int < #Divisor_float_exp int run scoreboard players add #float_exp int 1

execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_exp int < #float_exp int run scoreboard players operation #Divisor_float_int0 int /= 10 const

execute unless score #Divisor_float_int0 int matches 0 run function large_number:float_add_subtra/new/2
execute if score #Divisor_float_int0 int matches 0 run data modify storage large_number:math float_add_subtra.output set from storage large_number:math float_add_subtra.input1
