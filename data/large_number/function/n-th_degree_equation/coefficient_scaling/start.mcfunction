##系数缩放算法

#data modify storage large_number:math companion_matrix set value [[0d,0d,1d],\
                                                                  [1d,0d,1d],\
                                                                  [0,1d,1d]]

#function large_number:n-th_degree_equation/coefficient_scaling/start

#方程次数：#n-th_degree_equ.n-th large_number.int

#系数缩放算法是采用了多项式系数的绝对值的最大值的n次方根作为缩放因子，记为a，然后常数项除以a^n，一次项除以a^(n-1)，以此类推……
#新得到的多项式的根乘a就是原方程的根，改变了多项式根的绝对距离但不改变相对距离。
#这样变换的多项式，原来的系数是首1，变换过程中仍然保持首1，适用于直接构造友矩阵进行QR方法的迭代。

data modify storage large_number:math temp_mat set value []
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-1][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-2][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-3][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-4][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-5][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-6][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-7][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-8][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-9][-1]
data modify storage large_number:math temp_mat append from storage large_number:math companion_matrix[-10][-1]

#全都取绝对值后构建一个新系数表
data modify storage large_number:math temp_nl_double_extrema_inp set value []
data modify storage large_number:math temp1 set from storage large_number:math temp_mat
execute if data storage large_number:math temp1[0] run function large_number:n-th_degree_equation/coefficient_scaling/loop1

#第一次缩放
data modify storage large_number:math double_extrema.input set from storage large_number:math temp_nl_double_extrema_inp
data modify storage large_number:math double_extrema.mode set value "max"
function large_number:list_operation/double_extrema/start
data modify storage large_number:math temp_coe_m set from storage large_number:math double_extrema.output
execute store result score #temp1 large_number.int run data get storage large_number:math temp_coe_m
execute if score #temp1 large_number.int matches 101.. run scoreboard players set #temp_suo_fang_nth large_number.int 1
execute if score #temp1 large_number.int matches 101.. run function large_number:n-th_degree_equation/coefficient_scaling/suo_fang_1
data modify storage large_number:math temp_coe_m1 set from storage large_number:math temp_coe_m

#变换后的系数再次取绝对值构建一个新系数表
data modify storage large_number:math temp_nl_double_extrema_inp set value []
data modify storage large_number:math temp1 set from storage large_number:math temp_mat
execute if data storage large_number:math temp1[0] run function large_number:n-th_degree_equation/coefficient_scaling/loop1

#第二次缩放
data modify storage large_number:math double_extrema.input set from storage large_number:math temp_nl_double_extrema_inp
data modify storage large_number:math double_extrema.mode set value "max"
function large_number:list_operation/double_extrema/start
data modify storage large_number:math temp_coe_m set from storage large_number:math double_extrema.output
execute store result score #temp1 large_number.int run data get storage large_number:math temp_coe_m
execute if score #temp1 large_number.int matches 101.. run scoreboard players set #temp_suo_fang_nth large_number.int 2
execute if score #temp1 large_number.int matches 101.. run function large_number:n-th_degree_equation/coefficient_scaling/suo_fang_1
data modify storage large_number:math temp_coe_m2 set from storage large_number:math temp_coe_m

data modify storage large_number:math companion_matrix[-1][-1] set from storage large_number:math temp_mat[0]
data modify storage large_number:math companion_matrix[-2][-1] set from storage large_number:math temp_mat[1]
data modify storage large_number:math companion_matrix[-3][-1] set from storage large_number:math temp_mat[2]
data modify storage large_number:math companion_matrix[-4][-1] set from storage large_number:math temp_mat[3]
data modify storage large_number:math companion_matrix[-5][-1] set from storage large_number:math temp_mat[4]
data modify storage large_number:math companion_matrix[-6][-1] set from storage large_number:math temp_mat[5]
data modify storage large_number:math companion_matrix[-7][-1] set from storage large_number:math temp_mat[6]
data modify storage large_number:math companion_matrix[-8][-1] set from storage large_number:math temp_mat[7]
data modify storage large_number:math companion_matrix[-9][-1] set from storage large_number:math temp_mat[8]
data modify storage large_number:math companion_matrix[-10][-1] set from storage large_number:math temp_mat[9]
