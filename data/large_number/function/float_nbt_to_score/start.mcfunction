data modify storage large_number:math Store_float_nbt_to_score_input set string storage large_number:math float_nbt_to_score_input 0 1
execute if data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/0
execute unless data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/1

execute if score #float_int0 int matches -2147483648 run scoreboard players set #float_int0 int 2147483647
execute if score #float_int0 int matches ..-1 run scoreboard players operation #float_int0 int *= -1 const
