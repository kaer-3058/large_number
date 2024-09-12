scoreboard players set #leading_zeros int 0
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp10:"0"} run scoreboard players set #leading_zeros int 1
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 3
execute if data storage large_number:math {stemp10:"0.0"} run scoreboard players set #leading_zeros int 2
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 4
execute if data storage large_number:math {stemp10:"0.00"} run scoreboard players set #leading_zeros int 3
execute if score #leading_zeros int matches 1 store success storage large_number:math high_precision_stemp4 double -20.723265836946400 store result storage large_number:math ln_la_temp3 double 1 run data get storage large_number:math ln_high_precision.input 1000000000
execute if score #leading_zeros int matches 2 store success storage large_number:math high_precision_stemp4 double -23.025850929940500 store result storage large_number:math ln_la_temp3 double 1 run data get storage large_number:math ln_high_precision.input 10000000000
execute if score #leading_zeros int matches 3 store success storage large_number:math high_precision_stemp4 double -25.328436022934500 store result storage large_number:math ln_la_temp3 double 1 run data get storage large_number:math ln_high_precision.input 100000000000
