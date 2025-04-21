##定积分 - 黎曼积分法 - 离散点积分

#原理：梯形法则

#输入[double二维点列]：data modify storage large_number:math area_ab_discrete_points.input set value [[1.0,2.0],[2.0,2.5]]
#需要自行排序

#data modify storage large_number:math area_ab_discrete_points.input set value [[2.0,0.6931471805599],[2.4,0.8754687373539],[2.8,1.0296194171812],[3.2,1.1631508098057],[3.6,1.2809338454621],[4.0,1.3862943611199],[4.4,1.4816045409242],[4.8,1.5686159179138],[5.2,1.6486586255874],[5.6,1.7227665977411],[6.0,1.7917594692281]]

#function large_number:definite_integral/discrete_points/start

data modify storage large_number:math temp1_sum_inp set value []

data modify storage large_number:math store_sort_inp_x set value []
data modify storage large_number:math store_sort_inp_x append from storage large_number:math area_ab_discrete_points.input[][0]
data modify storage large_number:math store_sort_inp_y set value []
data modify storage large_number:math store_sort_inp_y append from storage large_number:math area_ab_discrete_points.input[][1]

#循环
execute if data storage large_number:math store_sort_inp_x[1] run function large_number:definite_integral/discrete_points/loop1

#相加
data modify storage large_number:math list_sum.input set from storage large_number:math temp1_sum_inp
function large_number:list_operation/sum/start


#除以2

function large_number:definite_integral/discrete_points/macro1 with storage large_number:math list_sum

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 1
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math area_ab_discrete_points.output set from storage large_number:math sstemp06

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.definite_integral.end","fallback": "\u00A77\u00A7o定积分求解完成"}
