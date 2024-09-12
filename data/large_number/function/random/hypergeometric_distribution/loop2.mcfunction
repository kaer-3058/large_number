data modify storage large_number:math sstemp1 set value {a:0}
execute store result storage large_number:math sstemp1.a int 1 run scoreboard players get #sstemp.point int
data modify storage large_number:math temp2 append from storage large_number:math sstemp1

scoreboard players remove #temp1 int 1
execute if score #temp1 int matches 1.. run function large_number:random/hypergeometric_distribution/loop2
