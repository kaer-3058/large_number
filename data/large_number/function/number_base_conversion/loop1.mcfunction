execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int /= #conversion.10_to_any.radix large_number.int
execute store result storage large_number:math stemp1.a int 1 run scoreboard players operation #temp2 large_number.int %= #conversion.10_to_any.radix large_number.int
execute if score #temp2 large_number.int matches 0..9 unless score #conversion.10_to_any.radix large_number.int matches ..10 run data modify storage large_number:math stemp1.a set string storage large_number:math stemp1.a
data modify storage large_number:math temp1 prepend from storage large_number:math stemp1
execute if score #temp1 large_number.int >= #conversion.10_to_any.radix large_number.int run function large_number:number_base_conversion/loop1
