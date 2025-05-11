##N阶线性方程组 - 高斯消元法(带行交换)
#输入值仅接受double

#输入系数方阵：data modify storage large_number:math linear_equations.inputA set value [[4.17d,15d,7d],[6d,13.5d,4d],[-28.15d,2d,12d]]
#系数方阵输入规则：必须有两层列表，每个子列表表示一行。如果某个元素为0也必须输入0，不支持元素省略。
#支持1~10阶矩阵。

#输入等号右边的列向量：data modify storage large_number:math linear_equations.inputB set value [7.0, 8.6, 2.33]
#列向量输入规则：单层列表，第一个元素对应矩阵第一行，第二个对应第二行，以此类推

#设置为1b即可计算系数矩阵的行列式：data modify storage large_number:math linear_equations.ope_det set value 1b

#输出：消元后得到的上三角矩阵，

#表示矩阵中绝对值最小的元素以某种精度接近0。这是一个整数参数，范围为-8~1。例如，如果参数值为-6，则表示矩阵中绝对值最小的元素在最高1e-6精度下接近0
#设置矩阵最小元素达到某个精度时视为这个矩阵不满秩，即方程组不存在唯一解：data modify storage large_number:math linear_equations.min_approaching set value -6
#范围为-8~1

#function large_number:linear_equations/start

data modify storage large_number:math store_det_input set from storage large_number:math linear_equations.inputA
scoreboard players set #temp_det_sign int 1
data modify storage large_number:math linear_equations.output set value []
data modify storage large_number:math store_vecb set from storage large_number:math linear_equations.inputB
execute store result score #temp_min_approaching int run data get storage large_number:math linear_equations.min_approaching

#判断系数方阵阶数
data modify storage large_number:math temp1 set from storage large_number:math store_det_input
execute store result score #determinant.order int run data get storage large_number:math temp1
scoreboard players operation #temp2 int = #determinant.order int
execute store result score #temp1 int if data storage large_number:math temp1[][]
scoreboard players operation #temp2 int *= #temp2 int
execute unless score #temp1 int = #temp2 int run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0][0] run scoreboard players set #determinant.order int -1
execute unless data storage large_number:math temp1[0] run scoreboard players set #determinant.order int 0

#消元核心
data modify storage large_number:math temp_output_matrix set value [[0d]]
data modify storage large_number:math temp_output_matrix[0][0] set from storage large_number:math store_det_input[0][0]
data modify storage large_number:math temp_int_extrema_inp set value []
execute if score #determinant.order int matches 1.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2 run function large_number:linear_equations/2.1
execute if score #determinant.order int matches 3 run function large_number:linear_equations/3.1
execute if score #determinant.order int matches 4 run function large_number:linear_equations/4.1
execute if score #determinant.order int matches 5 run function large_number:linear_equations/5.1
execute if score #determinant.order int matches 6 run function large_number:linear_equations/6.1
execute if score #determinant.order int matches 7 run function large_number:linear_equations/7.1
execute if score #determinant.order int matches 8 run function large_number:linear_equations/8.1
execute if score #determinant.order int matches 9 run function large_number:linear_equations/9.1
execute if score #determinant.order int matches 10 run function large_number:linear_equations/10.1

#判断最后一个元素接近0的程度
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[-1][-1]
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/macro1 with storage large_number:math

scoreboard players set #max_precision int 1
execute store result score #temp1 int run data get storage large_number:math temp1
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int 0
execute store result score #temp1 int run data get storage large_number:math temp1 10
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -1
execute store result score #temp1 int run data get storage large_number:math temp1 100
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -2
execute store result score #temp1 int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -3
execute store result score #temp1 int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -4
execute store result score #temp1 int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -5
execute store result score #temp1 int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -6
execute store result score #temp1 int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -7
execute store result score #temp1 int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches ..4 run scoreboard players set #max_precision int -8

execute if score #max_precision int <= #temp_min_approaching int run scoreboard players set #determinant.order int -2

execute store result storage large_number:math temp1 int 1 run scoreboard players get #max_precision int
data modify storage large_number:math temp_int_extrema_inp append from storage large_number:math temp1


data modify storage large_number:math linear_equations.output_matrix set from storage large_number:math temp_output_matrix

#int列表的最大值/最小值 - 任意两个元素之差不会超出int范围 - 找出主元的最小精度
data modify storage large_number:math stempd set from storage large_number:math temp_int_extrema_inp
execute store result score #float_comparison_sizes_B int run data get storage large_number:math stempd[0]
execute if data storage large_number:math stempd[1] run function large_number:linear_equations/int_extrema_small/loop
execute if score #float_comparison_sizes_B int <= #temp_min_approaching int run scoreboard players set #determinant.order int -2
execute store result storage large_number:math linear_equations.matrix_approaching_zero int 1 run scoreboard players get #float_comparison_sizes_B int

execute if score #determinant.order int matches ..0 run data modify storage large_number:math linear_equations.output set from storage large_number:math buffer_NaN

execute store result storage large_number:math linear_equations.order int 1 run scoreboard players get #determinant.order int

#计算行列式
execute if data storage large_number:math linear_equations{ope_det:1b} run function large_number:linear_equations/det
data modify storage large_number:math linear_equations.det_sign set value 1b
execute if score #temp_det_sign int matches -1 run data modify storage large_number:math linear_equations.det_sign set value -1b

#进行回代
data modify storage large_number:math temp_x set value []

execute if score #determinant.order int matches 10.. run function large_number:linear_equations/ope_x/10
execute if score #determinant.order int matches 9.. run function large_number:linear_equations/ope_x/9
execute if score #determinant.order int matches 8.. run function large_number:linear_equations/ope_x/8
execute if score #determinant.order int matches 7.. run function large_number:linear_equations/ope_x/7
execute if score #determinant.order int matches 6.. run function large_number:linear_equations/ope_x/6
execute if score #determinant.order int matches 5.. run function large_number:linear_equations/ope_x/5
execute if score #determinant.order int matches 4.. run function large_number:linear_equations/ope_x/4
execute if score #determinant.order int matches 3.. run function large_number:linear_equations/ope_x/3
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/ope_x/2
execute if score #determinant.order int matches 1.. run function large_number:linear_equations/ope_x/1

data modify storage large_number:math linear_equations.output append from storage large_number:math temp_x[]
