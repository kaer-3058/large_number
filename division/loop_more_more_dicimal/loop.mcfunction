scoreboard players operation #store_float_int0 int %= #Divisor_float_int0 int
scoreboard players operation #store_float_int0 int *= 10 const
scoreboard players operation #stemp1 int = #store_float_int0 int
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #stemp1 int /= #Divisor_float_int0 int
data modify storage large_number:math loop_more_more_dicimal_base append from storage large_number:math temp1

scoreboard players remove #loop_more_more_dicimal_times int 1
execute if score #loop_more_more_dicimal_times int matches 2.. run function large_number:division/loop_more_more_dicimal/loop
