##数组除以常数，常数不能超过五位数
#保留四位小数

#data modify storage large_number:math list_div_const.dividend set value [I;0,0,0]
#scoreboard players set #list_div_const_divisor int 0

#取数
data modify storage large_number:math list_div_const.output set value [I;0,0,0,0]
execute store result score #temp2 int store result score #temp1 int run data get storage large_number:math list_div_const.dividend[-3]
execute store result score #sstemp101 int run data get storage large_number:math list_div_const.dividend[-2]
execute store result score #sstemp102 int run data get storage large_number:math list_div_const.dividend[-1]

#计算
execute store result storage large_number:math list_div_const.output[0] int 1 run scoreboard players operation #temp1 int /= #list_div_const_divisor int
scoreboard players operation #temp2 int %= #list_div_const_divisor int
scoreboard players operation #temp2 int *= 10000 const
execute store result score #temp3 int run scoreboard players operation #temp2 int += #sstemp101 int
execute store result storage large_number:math list_div_const.output[1] int 1 run scoreboard players operation #temp2 int /= #list_div_const_divisor int
scoreboard players operation #temp3 int %= #list_div_const_divisor int
scoreboard players operation #temp3 int *= 10000 const
execute store result score #temp4 int run scoreboard players operation #temp3 int += #sstemp102 int
execute store result storage large_number:math list_div_const.output[2] int 1 run scoreboard players operation #temp3 int /= #list_div_const_divisor int
scoreboard players operation #temp4 int %= #list_div_const_divisor int
scoreboard players operation #temp4 int *= 10000 const
execute store result storage large_number:math list_div_const.output[3] int 1 run scoreboard players operation #temp4 int /= #list_div_const_divisor int
