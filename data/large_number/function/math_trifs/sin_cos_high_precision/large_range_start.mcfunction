##高精度正弦和余弦 - 弧度制

#查表+三角函数和角公式
#在x较小时，cos(x)≈1，sin(x)≈x

#输入[浮点数]：data modify storage large_number:math sin_cos_high_precision.input set value 25.33
#输入范围：|x|<37480660.27289

#execute if predicate {"condition":"location_check","predicate":{"position":{"y":{"max":-1}}}}

#function large_number:math_trifs/sin_cos_high_precision/large_range_start

data modify storage large_number:math store_sin_cos_hp_inp set from storage large_number:math sin_cos_high_precision.input
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_sin_cos_hp_inp
function large_number:gamma_function/robert_h_windschitl/mul_180_pi
data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math float_multiply.output

#把输入值钳制在[0,360)区间
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sin_cos_high_precision.input
function large_number:math_trifs/sin_cos_high_precision/mul_1_360
data modify storage large_number:math round_double.input set from storage large_number:math float_multiply.output
scoreboard players set #round_towards_zero large_number.int 0
function large_number:round_double/start
function large_number:math_trifs/sin_cos_high_precision/macro10 with storage large_number:math round_double

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sin_cos_high_precision.input
#data modify storage large_number:math temp2 set from storage large_number:math 
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

execute store result score #sstempx large_number.int run data get storage large_number:math temp1 1000000
execute store result score #sstempz large_number.int store result score #sstempy large_number.int run scoreboard players operation #sstempx large_number.int %= 360000000 const


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

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math store_sin_cos_hp_inp
