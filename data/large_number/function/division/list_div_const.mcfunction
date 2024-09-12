##数组除以常数，常数不能超过五位数
#保留四位小数

#data modify storage large_number:math list_div_const.dividend set value [I;0,0,0]
#scoreboard players set #list_div_const_divisor int 0

#取数
scoreboard players operation #store_divisor int = #list_div_const_divisor int
data modify storage large_number:math list_div_const.output set value [I;0,0,0,0]
execute store result score #temp1 int run data get storage large_number:math list_div_const.dividend[0]
execute store result score #sstemp101 int run data get storage large_number:math list_div_const.dividend[1]
execute store result score #sstemp102 int run data get storage large_number:math list_div_const.dividend[2]

#取绝对值
scoreboard players set #math_list_is- int 0
execute if score #temp1 int matches ..-1 store success score #math_list_is- int run scoreboard players operation #temp1 int *= -1 const
execute if score #sstemp101 int matches ..-1 store success score #math_list_is- int run scoreboard players operation #sstemp101 int *= -1 const
execute if score #sstemp102 int matches ..-1 store success score #math_list_is- int run scoreboard players operation #sstemp102 int *= -1 const
scoreboard players set #const_is- int 0
execute if score #store_divisor int matches ..-1 store success score #const_is- int run scoreboard players operation #store_divisor int *= -1 const

#计算
execute store result storage large_number:math list_div_const.output[0] int 1 store result score #sstemp1 int run scoreboard players operation #temp1 int /= #store_divisor int
execute store result score #temp2 int run data get storage large_number:math list_div_const.dividend[0]
scoreboard players operation #sstemp1 int *= #store_divisor int
scoreboard players operation #temp2 int -= #sstemp1 int
scoreboard players operation #temp2 int *= 10000 const
execute store result score #temp3 int run scoreboard players operation #temp2 int += #sstemp101 int
execute store result storage large_number:math list_div_const.output[1] int 1 store result score #sstemp2 int run scoreboard players operation #temp2 int /= #store_divisor int
scoreboard players operation #sstemp2 int *= #store_divisor int
scoreboard players operation #temp3 int -= #sstemp2 int
scoreboard players operation #temp3 int *= 10000 const
execute store result score #temp4 int run scoreboard players operation #temp3 int += #sstemp102 int
execute store result score #sstemp2 int store result storage large_number:math list_div_const.output[2] int 1 run scoreboard players operation #temp3 int /= #store_divisor int
scoreboard players operation #sstemp2 int *= #store_divisor int
scoreboard players operation #temp4 int -= #sstemp2 int
scoreboard players operation #temp4 int *= 10000 const
execute store result storage large_number:math list_div_const.output[3] int 1 run scoreboard players operation #temp4 int /= #store_divisor int

#处理符号
data modify storage large_number:math list_div_const.output_sign set value 1b
execute unless score #math_list_is- int = #const_is- int run data modify storage large_number:math list_div_const.output_sign set value -1b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 run data modify storage large_number:math list_div_const.output_sign set value 0b
