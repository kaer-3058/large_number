##高精度正弦和余弦

#查表+三角函数和角公式
#在x较小时，cos(x)≈1，sin(x)≈x

#需要载入数据库：function large_number:math_trifs/sin_cos_high_precision/database

#输入[float]：data modify storage large_number:math sin_cos_high_precision.input set value 83.4496f

#execute if predicate {"condition":"location_check","predicate":{"position":{"y":{"max":-1}}}}

execute store result score #sstempm int run data get storage large_number:math sin_cos_high_precision.input
execute if score #sstempm int matches ..16777215 run function large_number:math_trifs/sin_cos_high_precision/if.1
execute if score #sstempm int matches 16777216.. run function large_number:math_trifs/sin_cos_high_precision/if.2
execute if score #sstempm int matches -16777215.. run function large_number:math_trifs/sin_cos_high_precision/if.1
execute if score #sstempm int matches ..-16777216 run function large_number:math_trifs/sin_cos_high_precision/if.2

#输入值拆成三个部分
execute store result storage large_number:math s1 int 1 run scoreboard players operation #sstempx int /= 1000000 const
scoreboard players operation #sstempy int %= 1000000 const
execute store result storage large_number:math s2 int 1 run scoreboard players operation #sstempy int /= 10000 const
execute store result storage large_number:math sstempz int 174532.92519943295769236907 run scoreboard players operation #sstempz int %= 10000 const

#宏索引法查表
execute store result score #sin_inte int run function large_number:math_trifs/sin_cos_high_precision/macro1 with storage large_number:math
execute store result score #sin_deci_12 int run function large_number:math_trifs/sin_cos_high_precision/macro2 with storage large_number:math
execute store result score #cos_inte int run function large_number:math_trifs/sin_cos_high_precision/macro3 with storage large_number:math
execute store result score #cos_deci_12 int run function large_number:math_trifs/sin_cos_high_precision/macro4 with storage large_number:math


#sin 前两部分
execute store result storage large_number:math temp1 int 1 run scoreboard players get #sin_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #cos_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #sin_high_precision int run data get storage large_number:math int_mult2_out .000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #sin_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp_cosa_sinb int run data get storage large_number:math int_mult2_out .00000000001

scoreboard players operation #sin_high_precision int += #temp_cosa_sinb int

#cos 前两部分
execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #cos_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #cos_high_precision int run data get storage large_number:math int_mult2_out .000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #sin_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #sin_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp_sina_sinb int run data get storage large_number:math int_mult2_out .00000000001

scoreboard players operation #cos_high_precision int -= #temp_sina_sinb int


# 总
execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_high_precision int
data modify storage large_number:math temp2 set from storage large_number:math sstempz
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp1 int run data get storage large_number:math int_mult2_out .0000000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #sin_high_precision int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp2 int run data get storage large_number:math int_mult2_out .0000000000001

execute store result storage large_number:math sin_cos_high_precision.sin double .000000001 run scoreboard players operation #sin_high_precision int += #temp1 int
execute store result storage large_number:math sin_cos_high_precision.cos double .000000001 run scoreboard players operation #cos_high_precision int -= #temp2 int
