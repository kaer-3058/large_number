##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

#data modify storage large_number:math double_to_int.input set value 6337.1544375d

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage large_number:math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math double_to_int.input 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp4:"-"} store success storage large_number:math double_to_int.output.sign byte -1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

data modify storage large_number:math temp1 set string storage large_number:math temp1 0 17

#测试小数点的位置
execute store result score #temp2 int run data get storage large_number:math double_to_int.input
execute if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute if score #temp2 int matches 0..9 run scoreboard players set #temp1 int 2
execute if score #temp2 int matches 10..99 run scoreboard players set #temp1 int 3
execute if score #temp2 int matches 100..999 run scoreboard players set #temp1 int 4
execute if score #temp2 int matches 1000..9999 run scoreboard players set #temp1 int 5
execute if score #temp2 int matches 10000..99999 run scoreboard players set #temp1 int 6
execute if score #temp2 int matches 100000..999999 run scoreboard players set #temp1 int 7
execute if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp1 int 8
execute store result storage large_number:math temp5_1 int 1.0 store result storage large_number:math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

#以小数点为界拆开
execute store result storage large_number:math temp5_2 int 1.0 run scoreboard players remove #temp1 int 1
function large_number:macro_operation/macro_cut_double_string with storage large_number:math

function large_number:macro_operation/double_ope_macro1 with storage large_number:math

#测试前导0的数量
data modify storage large_number:math temp6 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {temp6:"0"} run data modify storage large_number:math double_to_int.output.leading_zeros set value 1b
data modify storage large_number:math temp6 set string storage large_number:math temp2 0 2
execute if data storage large_number:math {temp6:"00"} run data modify storage large_number:math double_to_int.output.leading_zeros set value 2b
data modify storage large_number:math temp6 set string storage large_number:math temp2 0 3
execute if data storage large_number:math {temp6:"000"} run data modify storage large_number:math double_to_int.output.leading_zeros set value 3b

#从后往前逐位读取到计分板，自动靠后对齐
data modify storage large_number:math temp6 set value "0"
data modify storage large_number:math temp7 set value "0"
data modify storage large_number:math temp8 set value "0"
data modify storage large_number:math temp9 set value "0"
execute store result score #math_length int run data get storage large_number:math temp2
execute if score #math_length int matches 0..4 run data modify storage large_number:math temp9 set from storage large_number:math temp2
execute if score #math_length int matches 5.. run data modify storage large_number:math temp9 set string storage large_number:math temp2 -4
execute if score #math_length int matches 5.. run data modify storage large_number:math temp8 set string storage large_number:math temp2 0 -4
execute if score #math_length int matches 9.. run data modify storage large_number:math temp7 set string storage large_number:math temp8 0 -4
execute if score #math_length int matches 9.. run data modify storage large_number:math temp8 set string storage large_number:math temp8 -4
execute if score #math_length int matches 13.. run data modify storage large_number:math temp6 set string storage large_number:math temp7 0 -4
execute if score #math_length int matches 13.. run data modify storage large_number:math temp7 set string storage large_number:math temp7 -4

#最终赋值
function large_number:macro_operation/double_ope_macro3 with storage large_number:math

#测试数字是否为0
execute if data storage large_number:math double_to_int{input:0.0d} store success storage large_number:math double_to_int.output.point byte 0 store result storage large_number:math double_to_int.output.leading_zeros byte 0 run data modify storage large_number:math double_to_int.output.sign set value 0b
