#高斯误差函数

#输入：data modify storage large_number:math error_function.input set value 1.2

execute store result score #temp1 int run data get storage large_number:math error_function.input 10000000
execute if score #temp1 int matches ..-90162867 run data modify storage large_number:math error_function.output set value -1.0
execute if score #temp1 int matches 90162867.. run data modify storage large_number:math error_function.output set value 1.0
execute if score #temp1 int matches -90162866..90162866 run function large_number:error_function/2
