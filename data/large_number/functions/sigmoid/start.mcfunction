##Sigmoid函数 - 线性近似

#原理参见：https://zhuanlan.zhihu.com/p/318423774

#data modify storage large_number:math sigmoid.input set value 1.0

data modify storage large_number:math temp_test_sigmoid_inp set from storage large_number:math sigmoid.input
data modify storage large_number:math temp1 set string storage large_number:math temp_test_sigmoid_inp 0 1
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp2 set string storage large_number:math temp_test_sigmoid_inp 1 -1
execute if data storage large_number:math {temp1:"-"} run function large_number:sigmoid/macro1 with storage large_number:math
execute store success score #temp_test_sigmoid_inp_is- int if data storage large_number:math {temp1:"-"}

execute store result score #temp_test_sigmoid_inp int run data get storage large_number:math temp_test_sigmoid_inp 100000000
execute if score #temp_test_sigmoid_inp int matches 237500000..500000000 run function large_number:sigmoid/1
execute if score #temp_test_sigmoid_inp int matches 100000000..237499999 run function large_number:sigmoid/2
execute if score #temp_test_sigmoid_inp int matches 0..99999999 run function large_number:sigmoid/3
execute if score #temp_test_sigmoid_inp int matches 500000001..690675477 run data modify storage large_number:math sigmoid.output set value 0.999
execute if score #temp_test_sigmoid_inp int matches 690675478..921024036 run data modify storage large_number:math sigmoid.output set value 0.9999
execute if score #temp_test_sigmoid_inp int matches 921024037.. run data modify storage large_number:math sigmoid.output set value 1.0

execute if score #temp_test_sigmoid_inp_is- int matches 1 run function large_number:sigmoid/4
