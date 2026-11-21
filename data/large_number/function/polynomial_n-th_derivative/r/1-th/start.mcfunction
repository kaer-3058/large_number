##实数域多项式的1阶导数

#输入多项式系数：data modify storage large_number:math polynomial_n-th_derivative.input set value [{x:7d,i:-5d},6.2d,-0.03,{i:28.2},{x:15.7},{x:-12,i:25},-1.0]
#按顺序从最高次一直写到常数次，浮点数格式，支持实数，最高次的系数不能为0，其余项若为0也要写上0d。

#计算：function large_number:polynomial_n-th_derivative/r/1-th/start

data modify storage large_number:math polynomial_n-th_derivative.output set value []
data modify storage large_number:math list_ope_const_inp set from storage large_number:math polynomial_n-th_derivative.input

execute unless data storage large_number:math list_ope_const_inp[1] run data modify storage large_number:math list_ope_const_inp set value [0d]
execute if data storage large_number:math list_ope_const_inp[1] run function large_number:polynomial_n-th_derivative/r/1-th/next

data modify storage large_number:math polynomial_n-th_derivative.output set from storage large_number:math list_ope_const_inp
