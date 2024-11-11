##指数分布的随机数

#范围：[0,20.7232]
#指数分布概率密度函数为：λe^-(λx)
#λ(放大一千倍)：#random.λ int

#(0,1)开区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #ln(x) int run data get storage large_number:math random_number_0_1 1000000000
execute if score #ln(x) int matches ..-1 store result score #ln(x) int run random value 0..1000000000
execute if score #ln(x) int matches 1000000001.. store result score #ln(x) int run random value 0..1000000000
scoreboard players operation #ln(x) int *= -1 const
scoreboard players add #ln(x) int 1000000000

function large_number:ln/start
scoreboard players remove #ln(x).output int 207232
scoreboard players operation #ln(x).output int *= -1000 const
execute store result storage large_number:math random_as_exponential_distribution double .0001 run scoreboard players operation #ln(x).output int /= #random.λ int

#生成各种分布随机数的通解：
#设随机变量U满足(0,1)上的均匀分布。若某连续的概率分布函数f(x)是严格单调增函数，则随机变量f^-1(U)是近似满足此分布的随机数。

#设U是(0,1)上的均匀分布随机数，则：
#标准正态分布：生成12次U相加然后减6
#指数分布：-ln(1-U)/λ
#伽马分布：α个指数分布随机数相加
