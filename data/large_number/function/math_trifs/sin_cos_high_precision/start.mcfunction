##高精度正弦和余弦 - 角度制

#查表+三角函数和角公式
#在x较小时，cos(x)≈1，sin(x)≈x

#需要载入数据库：function large_number:math_trifs/sin_cos_high_precision/database

#输入[float]：data modify storage large_number:math sin_cos_high_precision.input set value 83.4496f

#execute if predicate {"condition":"location_check","predicate":{"position":{"y":{"max":-1}}}}

#function large_number:math_trifs/sin_cos_high_precision/start

execute store result score #sstempm large_number.int run data get storage large_number:math sin_cos_high_precision.input
execute if score #sstempm large_number.int matches -16777215..16777215 run function large_number:math_trifs/sin_cos_high_precision/if.1
execute unless score #sstempm large_number.int matches -16777215..16777215 run function large_number:math_trifs/sin_cos_high_precision/if.2

#输入值拆成三个部分
execute store result storage large_number:math s1 int 1 run scoreboard players operation #sstempx large_number.int /= 1000000 const
scoreboard players operation #sstempy large_number.int %= 1000000 const
execute store result storage large_number:math s2 int 1 run scoreboard players operation #sstempy large_number.int /= 10000 const

#宏索引法查表
function large_number:math_trifs/sin_cos_high_precision/macro1 with storage large_number:math

#sin 前两部分
function large_number:math_trifs/sin_cos_high_precision/macro2 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/macro3 with storage large_number:math
execute store result storage large_number:math temp_sin_high_precision int 1 store result score #sin_high_precision large_number.int run data get storage large_number:math int_mul_1 .000000001
execute store result score #temp_cosa_sinb large_number.int run data get storage large_number:math int_mul_2 .00000000001
scoreboard players operation #sin_high_precision large_number.int += #temp_cosa_sinb large_number.int

#cos 前两部分
function large_number:math_trifs/sin_cos_high_precision/macro4 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/macro7 with storage large_number:math
execute store result storage large_number:math temp_cos_high_precision int 1 store result score #cos_high_precision large_number.int run data get storage large_number:math int_mul_3 .000000001
execute store result score #temp_sina_sinb large_number.int run data get storage large_number:math int_mul_4 .00000000001
scoreboard players operation #cos_high_precision large_number.int -= #temp_sina_sinb large_number.int

# 总
execute store result storage large_number:math temp2 int 174532.92519943295769236907 run scoreboard players operation #sstempz large_number.int %= 10000 const
function large_number:math_trifs/sin_cos_high_precision/macro8 with storage large_number:math
execute store result score #temp1 large_number.int run data get storage large_number:math int_mult2_out .0000000000001
function large_number:math_trifs/sin_cos_high_precision/macro9 with storage large_number:math
execute store result score #temp2 large_number.int run data get storage large_number:math int_mult2_out .0000000000001

execute store result storage large_number:math sin_cos_high_precision.sin double .000000001 run scoreboard players operation #sin_high_precision large_number.int += #temp1 large_number.int
execute store result storage large_number:math sin_cos_high_precision.cos double .000000001 run scoreboard players operation #cos_high_precision large_number.int -= #temp2 large_number.int
