scoreboard players operation #float_int0 int *= #float_sign int
scoreboard players operation #Divisor_float_int0 int *= #Divisor_float_sign int

execute if score #float_add_subtra_ope_mode int matches 1 run scoreboard players operation #float_int0 int += #Divisor_float_int0 int
execute if score #float_add_subtra_ope_mode int matches 2 run scoreboard players operation #float_int0 int -= #Divisor_float_int0 int

data modify storage large_number:math temp0 set value ""
execute if score #float_int0 int matches ..-1 run data modify storage large_number:math temp0 set value "-"
execute if score #float_int0 int matches ..-1 run scoreboard players operation #float_int0 int *= -1 const

execute store result storage large_number:math temp1 int 1 run scoreboard players add #float_int0 int 100000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_exp int

function large_number:float_add_subtra/new/macro1 with storage large_number:math
data modify storage large_number:math float_add_subtra.output set from storage large_number:math q0
