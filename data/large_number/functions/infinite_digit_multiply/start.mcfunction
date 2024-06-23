##无穷位数字相乘

#输入格式：因数必须为万进制int数组，且数组元素全都是正数

#data modify storage large_number:math Infinite_digit_multiply.input1 set value [I;1722,659]
#data modify storage large_number:math Infinite_digit_multiply.input2 set value [I;33,1204]

data modify storage large_number:math temp1 set from storage large_number:math Infinite_digit_multiply.input1
data modify storage large_number:math temp2 set from storage large_number:math Infinite_digit_multiply.input2
data modify storage large_number:math stemp1 set value []
data modify storage large_number:math temp_addi_list set value []
data modify storage large_number:math stemp3 set value []

execute if data storage large_number:math temp1[0] if data storage large_number:math temp2[0] run function large_number:infinite_digit_multiply/loop2
execute if data storage large_number:math temp_addi_list[1] run function large_number:infinite_digit_multiply/large_addition.loop2
execute if data storage large_number:math temp_addi_list[0] unless data storage large_number:math temp_addi_list[1] run data modify storage large_number:math sstempd set from storage large_number:math temp_addi_list[0]

execute store result score #temp1 int run data get storage large_number:math sstempd[0]
execute if score #temp1 int matches 0 run function large_number:infinite_digit_multiply/del_leading_zeros

data modify storage large_number:math Infinite_digit_multiply.output set value [I;]
data modify storage large_number:math Infinite_digit_multiply.output append from storage large_number:math sstempd[]
