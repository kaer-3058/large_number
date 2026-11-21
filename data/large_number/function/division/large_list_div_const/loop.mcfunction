execute store result score #temp2 large_number.int run data get storage large_number:math sstemp1[0]
scoreboard players operation #temp1 large_number.int *= 10000 const
execute store result score #temp3 large_number.int run scoreboard players operation #temp1 large_number.int += #temp2 large_number.int
execute store result storage large_number:math temp int 1 run scoreboard players operation #temp3 large_number.int /= #large_list_div_const.divisor large_number.int
data modify storage large_number:math sstemp2 append from storage large_number:math temp
scoreboard players operation #temp1 large_number.int %= #large_list_div_const.divisor large_number.int

data remove storage large_number:math sstemp1[0]
execute if data storage large_number:math sstemp1[0] run function large_number:division/large_list_div_const/loop
