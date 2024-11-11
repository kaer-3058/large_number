##对double开立方根

#data modify storage large_number:math cube_root.input set value 155.7d

#function large_number:cube_root_double/start

data modify storage large_number:math store_cube_root_inp set from storage large_number:math cube_root.input

#取绝对值
data modify storage large_number:math temp1 set string storage large_number:math store_cube_root_inp 0 1
execute store success score #expression_evaluation_test2 int if data storage large_number:math {temp1:"-"}
execute if score #expression_evaluation_test2 int matches 1 run function large_number:cube_root_double/macro1 with storage large_number:math
execute if score #expression_evaluation_test2 int matches 1 run data modify storage large_number:math store_cube_root_inp set from storage large_number:math q0

#计算
execute store result storage large_number:math temp2 double 1 run data get storage large_number:math store_cube_root_inp
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp2 set from storage large_number:math store_cube_root_inp
execute if score #expression_evaluation_test1 int matches 0 run function large_number:cube_root_double/1
execute if score #expression_evaluation_test1 int matches 1 run function large_number:cube_root_double/2

#校正符号
execute if score #expression_evaluation_test2 int matches 1 run function large_number:cube_root_double/macro2 with storage large_number:math cube_root
execute if score #expression_evaluation_test2 int matches 1 run data modify storage large_number:math cube_root.output set from storage large_number:math q0
