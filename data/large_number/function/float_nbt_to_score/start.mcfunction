data modify storage large_number:math Store_float_nbt_to_score_input set string storage large_number:math float_nbt_to_score_input 0 1
execute if data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/0
execute unless data storage large_number:math {Store_float_nbt_to_score_input:"-"} run function large_number:float_nbt_to_score/1
