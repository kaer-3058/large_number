##迭代法无穷位大数除法 - 无穷位数组整除五~六位整数

#data modify storage large_number:math large_list_div_const.dividend set value [0,0,0]
#scoreboard players set #large_list_div_const.divisor int 0

data modify storage large_number:math sstemp1 set from storage large_number:math large_list_div_const.dividend
data modify storage large_number:math sstemp2 set value []

#递归
scoreboard players set #temp1 int 0
execute if data storage large_number:math sstemp1[0] run function large_number:division/large_list_div_const/loop

#去掉前导0
execute store result score #temp1 int run data get storage large_number:math sstemp2[0]
execute if score #temp1 int matches 0 if data storage large_number:math sstemp2[1] run function large_number:division/large_list_div_const/del_leading_zeros

data modify storage large_number:math large_list_div_const.output set from storage large_number:math sstemp2

tellraw @a {"text":"\u00A77\u00A7o大数除法计算完成"}
