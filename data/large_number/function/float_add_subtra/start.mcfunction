##浮点加减法

#data modify storage large_number:math float_add_subtra.input1 set value 1.0
#data modify storage large_number:math float_add_subtra.input2 set value 3.0
#scoreboard players set #float_add_subtra_ope_mode int 1

execute if score #float_add_subtra_ope_mode int matches 1 run function large_number:float_add_subtra/1
execute if score #float_add_subtra_ope_mode int matches 2 run function large_number:float_add_subtra/2
data modify storage large_number:math float_add_subtra.output set from storage large_number:math temp1
