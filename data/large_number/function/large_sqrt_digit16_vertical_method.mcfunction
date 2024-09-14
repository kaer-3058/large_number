##京级大数开方 - 竖式法取小数

#输入
#data modify storage large_number:math large_sqrt_digit16.input set value [I;0,0,0,0]

data modify storage large_number:math large_sqrt.input set value [0,0]
data modify storage large_number:math large_sqrt.input prepend from storage large_number:math large_sqrt_digit16.input[]

function large_number:large_sqrt

execute store result score #sstemp1 int run data get storage large_number:math large_sqrt.output[0]
execute store result score #sstemp2 int run data get storage large_number:math large_sqrt.output[1]
execute store result storage large_number:math large_sqrt_digit16.output_decimal double 0.0001 store result storage large_number:math temp2 int 1 run data get storage large_number:math large_sqrt.output[2]

scoreboard players operation #sstemp1 int *= 10000 const
execute store result storage large_number:math large_sqrt_digit16.output int 1 store result storage large_number:math temp1 int 1 run scoreboard players operation #sstemp1 int += #sstemp2 int

function large_number:macro_operation/large_sqrt_digit16_vertical_method.1 with storage large_number:math
