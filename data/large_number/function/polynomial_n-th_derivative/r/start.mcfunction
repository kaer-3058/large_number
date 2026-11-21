##实数域多项式的N阶导数

#输入多项式系数：data modify storage large_number:math polynomial_n-th_derivative.input set value [7d,6.2d,-0.03,28d,15.7,-12.25,-1.0]
#按顺序从最高次一直写到常数次，浮点数格式，支持实数，最高次的系数不能为0，其余项若为0也要写上0d。

#导数阶数：data modify storage large_number:math polynomial_n-th_derivative.n set value 1

#计算：function large_number:polynomial_n-th_derivative/r/start

#输出：data get storage large_number:math polynomial_n-th_derivative.output

data modify storage large_number:math polynomial_n-th_derivative.output set value []
data modify storage large_number:math list_ope_const_inp set from storage large_number:math polynomial_n-th_derivative.input

execute store result score #polynomial_n-th_derivative.n large_number.int run data get storage large_number:math polynomial_n-th_derivative.n
execute if score #polynomial_n-th_derivative.n large_number.int matches ..0 run data modify storage large_number:math polynomial_n-th_derivative.output set from storage large_number:math list_ope_const_inp
execute if score #polynomial_n-th_derivative.n large_number.int matches 1.. run function large_number:polynomial_n-th_derivative/r/loop1

data modify storage large_number:math polynomial_n-th_derivative.output set from storage large_number:math list_ope_const_inp
