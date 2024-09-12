execute store result score #temp2 int run scoreboard players operation #temp1 int /= #conversion.10_to_any.radix int
execute store result storage large_number:math stemp1.a int 1 run scoreboard players operation #temp2 int %= #conversion.10_to_any.radix int
execute if score #temp2 int matches 0..9 unless score #conversion.10_to_any.radix int matches ..10 run data modify storage large_number:math stemp1.a set string storage large_number:math stemp1.a
data modify storage large_number:math temp1 prepend from storage large_number:math stemp1
execute if score #temp1 int >= #conversion.10_to_any.radix int run function large_number:number_base_conversion/loop1
