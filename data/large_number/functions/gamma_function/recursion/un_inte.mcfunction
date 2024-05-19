##递推公式+查表法求gamma(x)
# Γ(x+1) = x·Γ(x) = Γ(x+1-a)·Π(x+1-n, n=1, a)

#把a拆成整数部分b和小数部分c，则
#gamma(a+1)=连乘(n+c, n=0, b)*gamma(c)，
#gamma(a+1)就是a的阶乘，a可取任意正实数。
#例如4.2!=1.2*2.2*3.2*4.2*gamma(0.2+1)
#对于正整数，则直接计算连乘。
#输入范围为区间: [0.001,170.6026)

#输入：data modify storage large_number:math gamma_function.input set value 73.2074d

##1.连乘

data modify storage large_number:math float_multiply.input1 set from storage large_number:math gamma_function.input
data modify storage large_number:math float_multiply.output set from storage large_number:math float_multiply.input1
execute store result score #temp1 int run data get storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.input1
execute if score #temp1 int matches 0 run data modify storage large_number:math float_multiply.output set from storage large_number:math gamma_function.input
execute if score #temp1 int matches 1.. run function large_number:gamma_function/recursion/loop
#-----------------------------------------#

##2.查表求前三位小数的伽玛值
execute store result score #temp1 int run data get storage large_number:math float_multiply.input1 1000
execute store result score #temp2 int run data get storage large_number:math float_multiply.input1 10000
scoreboard players operation #temp2 int %= 10 const
execute if score #temp2 int matches 5.. run scoreboard players add #temp1 int 1
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 int 1000
data modify storage large_number:math temp1 set string storage large_number:math temp1 -3
function large_number:gamma_function/recursion/macro2 with storage large_number:math

##3.浮点乘法
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/start

##4.最终输出
data modify storage large_number:math gamma_function.output set from storage large_number:math float_multiply.output
execute if data storage large_number:math gamma_function{input:1.0d} run data modify storage large_number:math gamma_function.output set value 1.0d
execute if data storage large_number:math gamma_function{input:0.0d} run data modify storage large_number:math gamma_function.output set value 1.0d
