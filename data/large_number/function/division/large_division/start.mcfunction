##迭代法无穷位大数除法 - 递归相减法

#被除数：data modify storage large_number:math large_division.input1 set value [77,1234,1772,6603,89]
#除数：data modify storage large_number:math large_division.input2 set value [23,1003,8825,1015,74]
#位数：data modify storage large_number:math large_division.times set value 10
#去掉后缀0：data modify storage large_number:math large_division.del_zeros set value 1

#要求输入的元素必须都是万进制int数组，且数组元素都是非负数，被除数的位数不能多于除数，需用户自行检查除数是否为0
#输出的数组第一位是整数部分，其余都是小数部分

#除法的本质就是减法，商就是能减多少次

data modify storage large_number:math div_1 set from storage large_number:math large_division.input1
data modify storage large_number:math div_2 set from storage large_number:math large_division.input2
execute store result score #loops int run data get storage large_number:math large_division.times
data modify storage large_number:math sstempz set value []

#总循环
execute if score #loops int matches 1.. run function large_number:division/large_division/loop_all

#去掉后缀0
execute store result score #temp1 int run data get storage large_number:math sstempz[-1]
execute if score #temp1 int matches 0 if data storage large_number:math large_division{del_zeros:1} if data storage large_number:math sstempz[-2] run function large_number:division/large_division/del_zero_2

data modify storage large_number:math large_division.output set from storage large_number:math sstempz


tellraw @a {"translate":"large_number.large_division.end","fallback": "\u00A77\u00A7o大数除法计算完成"}
