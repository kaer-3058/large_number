data modify storage large_number:math s1 set from storage large_number:math temp_s1[-2]
data modify storage large_number:math s2 set from storage large_number:math temp_s1[-1]
function large_number:expression_evaluation/macro2 with storage large_number:math
execute if data storage large_number:math {stemp1:"+"} run scoreboard players operation #temp2 int += #temp3 int
execute if data storage large_number:math {stemp1:"-"} run scoreboard players operation #temp2 int -= #temp3 int
execute if data storage large_number:math {stemp1:"*"} run scoreboard players operation #temp2 int *= #temp3 int
execute if data storage large_number:math {stemp1:"/"} run scoreboard players operation #temp2 int /= #temp3 int
data remove storage large_number:math temp_s1[-1]
data remove storage large_number:math temp_s1[-1]
execute store result storage large_number:math s1 int 1 run scoreboard players get #temp2 int
data modify storage large_number:math s1 set string storage large_number:math s1
data modify storage large_number:math temp_s1 append from storage large_number:math s1
