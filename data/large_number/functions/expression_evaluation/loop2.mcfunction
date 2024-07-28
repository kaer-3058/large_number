#取出第一个字符
data modify storage large_number:math stemp1 set string storage large_number:math sstemp2 0 1

#返回值法判断该字符是否是数字
data modify storage large_number:math temp_math set value ["0","1","2","3","4","5","6","7","8","9",".","E","-"]
scoreboard players set #temp1 int 13
execute store result score #temp1 int run data modify storage large_number:math temp_math[] set from storage large_number:math stemp1

#如果是数字，则把数字丢入临时列表里
execute unless score #temp1 int matches 13 run scoreboard players add #string_end_ int 1

#如果是数字，则把字符串第一个字符扔掉并继续递归
execute unless score #temp1 int matches 13 run data modify storage large_number:math sstemp2 set string storage large_number:math sstemp2 1
execute unless score #temp1 int matches 13 unless data storage large_number:math {sstemp2:""} run function large_number:expression_evaluation/loop2
