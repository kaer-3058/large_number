scoreboard players operation #float_int0 large_number.int *= #float_sign large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int *= #Divisor_float_sign large_number.int

execute if score #float_add_subtra_ope_mode large_number.int matches 1 run scoreboard players operation #float_int0 large_number.int += #Divisor_float_int0 large_number.int
execute if score #float_add_subtra_ope_mode large_number.int matches 2 run scoreboard players operation #float_int0 large_number.int -= #Divisor_float_int0 large_number.int

data modify storage large_number:math temp0 set value ""
execute if score #float_int0 large_number.int matches ..-1 run data modify storage large_number:math temp0 set value "-"
execute if score #float_int0 large_number.int matches -2147483648 run scoreboard players set #float_int0 large_number.int 2147483647
execute if score #float_int0 large_number.int matches ..-1 run scoreboard players operation #float_int0 large_number.int *= -1 const

execute store result storage large_number:math temp1 int 1 run scoreboard players add #float_int0 large_number.int 100000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_exp large_number.int

function large_number:float_add_subtra/new/macro1 with storage large_number:math
data modify storage large_number:math float_add_subtra.output set from storage large_number:math q0
