##换底公式计算log(a,b)
#对浮点数取对数
#log(a,b)=ln(b)/ln(a)

#底数：data modify storage large_number:math log(a,b)_double.a set value 5.1175
#真数：data modify storage large_number:math log(a,b)_double.b set value 17.61033

#ln(b)
data modify storage large_number:math ln_double.input set from storage large_number:math log(a,b)_double.b
function large_number:ln_double/start
data modify storage large_number:math float_division.input1 set from storage large_number:math ln_double.output

#ln(a)
data modify storage large_number:math ln_double.input set from storage large_number:math log(a,b)_double.a
function large_number:ln_double/start
data modify storage large_number:math float_division.input2 set from storage large_number:math ln_double.output

#除法
function large_number:division/float/start
data modify storage large_number:math log(a,b)_double.output set from storage large_number:math float_division.output

#特殊值判定
#以0或1为底的"不为1的数"的对数不存在
#任何数为底的1的对数都是0
#非0且非1的底数的0的对数都是负无穷
data modify storage large_number:math temp_a set string storage large_number:math log(a,b)_double.a 0 -1
data modify storage large_number:math temp_b set string storage large_number:math log(a,b)_double.b 0 -1
execute if data storage large_number:math {temp_a:"0.0"} unless data storage large_number:math {temp_b:"1.0"} run data modify storage large_number:math log(a,b)_double.output set from storage large_number:math buffer_NaN
execute if data storage large_number:math {temp_a:"1.0"} unless data storage large_number:math {temp_b:"1.0"} run data modify storage large_number:math log(a,b)_double.output set from storage large_number:math buffer_NaN
execute if data storage large_number:math {temp_b:"1.0"} run data modify storage large_number:math log(a,b)_double.output set value 0.0d
execute unless data storage large_number:math {temp_a:"0.0"} unless data storage large_number:math {temp_a:"1.0"} if data storage large_number:math {temp_b:"0.0"} run data modify storage large_number:math log(a,b)_double.output set value "-Infinityd"

#输出
execute store result score #loga.b.output int run data get storage large_number:math log(a,b)_double.output 10000
execute unless data storage large_number:math log(a,b)_double.output run scoreboard players reset #loga.b.output int
data modify storage large_number:math temp1 set string storage large_number:math log(a,b)_double.output 0 -1
execute if data storage large_number:math {temp1:"-Infinity"} run scoreboard players set #loga.b.output int -2147483648
