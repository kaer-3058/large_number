execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:lambertw/as_entity_2
data modify storage large_number:math ln_double.input set from storage large_number:math temp_ln1
function large_number:ln_double/start
execute store result storage large_number:math lambertw.output double 0.00007692307692308 run scoreboard players get #ln_double.output int
