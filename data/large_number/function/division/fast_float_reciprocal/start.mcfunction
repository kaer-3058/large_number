##快速估计浮点数的倒数

#输入[double]：data modify storage large_number:math fast_float_reciprocal.input set value 7.12
#精度：scoreboard players set #fast_float_reciprocal.1Ea int -1
#范围：-6~0

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:division/fast_float_reciprocal/start

#对于小于1的值，精度调到1e-3左右更准确
#而对于大于1的值，精度调到-3就不行了，精度是1e0到-2

tp .0 .0 .0
data modify entity @s Pos[0] set from storage large_number:math fast_float_reciprocal.input
execute at @s run function large_number:division/fast_float_reciprocal/ope

#纯execute画1/x，a趋近于0\
facing 0. ~a ~ positioned ^ ^ ^1/(2*a) rotated ~180 ~ positioned ^ ^ ^1/(2*a)

#输入执行位置  \
x y z  \
输出执行位置  \
x 1/x z

#算法发明人：逆天神域服务器
