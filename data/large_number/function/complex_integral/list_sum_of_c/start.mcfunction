##复数列表求和

#data modify storage large_number:math list_sum.input set from storage large_number:math temp1_sum_inp_1

#function large_number:complex_integral/list_sum_of_c/start

data modify storage large_number:math stempr set from storage large_number:math list_sum.input
data modify storage large_number:math stempr2 set from storage large_number:math stempr
data modify storage large_number:math list_sum.output set from storage large_number:math stempr[0]

data modify storage large_number:math complex_operation.z1 set from storage large_number:math stempr[0]
data remove storage large_number:math stempr[0]
execute if data storage large_number:math stempr[0] run function large_number:complex_integral/list_sum_of_c/loop

execute if data storage large_number:math stempr2[1] run data modify storage large_number:math list_sum.output set from storage large_number:math complex_operation.output
