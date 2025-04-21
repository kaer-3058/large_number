##反正弦函数 - arcsin(x) - 高精度
#输入正弦值，输出角度
#输入范围：[-1,1]
#公式：arcsin(x)=atan2(x, √(1-x^2))
#输入：data modify storage large_number:math arcsin_cos_high_precision.input set value 0.9999992197406
#执行：function large_number:math_trifs/arcsin_hp/start
#输出：data get storage large_number:math arcsin_cos_high_precision.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math arcsin_cos_high_precision.input
function large_number:float_mul.high_precision/squ/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/arccos_hp/as_entity_1
function large_number:double_sqrt
data modify storage large_number:math atan2_double.x set from storage large_number:math double_sqrt.output
data modify storage large_number:math atan2_double.y set from storage large_number:math arcsin_cos_high_precision.input
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start
data modify storage large_number:math arcsin_cos_high_precision.output set from storage large_number:math atan2_double.output
