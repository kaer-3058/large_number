##总和

#data modify storage large_number:math list_sum.input set value [1.0,7.0,6.0,5.233,16.23]

#function large_number:list_operation/sum/start

data modify storage large_number:math sstempr set from storage large_number:math list_sum.input
data modify storage large_number:math temp1 set from storage large_number:math sstempr[0]
data remove storage large_number:math sstempr[0]
execute if data storage large_number:math sstempr[0] run function large_number:list_operation/sum/loop1

data modify storage large_number:math list_sum.output set from storage large_number:math temp1
