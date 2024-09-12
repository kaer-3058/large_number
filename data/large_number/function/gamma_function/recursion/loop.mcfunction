##浮点乘法
#原理：把尾数和指数拆开，尾数相乘，指数相加，最后位移

#data modify storage large_number:math float_multiply.input1 set value 7.41
#data modify storage large_number:math float_multiply.input2 set value 17.233

#输入值减一，进行递推

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/recursion/input-1
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output

#判断是否要递归
execute store result score #temp1 int run data get storage large_number:math float_multiply.input1
execute if score #temp1 int matches 1.. run function large_number:gamma_function/recursion/loop
