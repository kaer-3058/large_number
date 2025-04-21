##参数方程 - 函数表达式转逆波兰式

#转化后直接覆盖此模块的逆波兰式输入接口，因此可以转化后直接进行图像绘制

#data modify storage large_number:math parametric_equation_particle.function_X set value ""
#data modify storage large_number:math parametric_equation_particle.function_Y set value ""
#输入规则等同于"表达式求值 - 科学计算"

data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math parametric_equation_particle.function_X
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation_scientific/loop1
execute if data storage large_number:math temp_s1[-1] run function large_number:expression_evaluation_scientific/loop5

data modify storage large_number:math parametric_equation_particle.rev_polish_notation_X set from storage large_number:math temp_s2

data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math parametric_equation_particle.function_Y
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation_scientific/loop1
execute if data storage large_number:math temp_s1[-1] run function large_number:expression_evaluation_scientific/loop5

data modify storage large_number:math parametric_equation_particle.rev_polish_notation_Y set from storage large_number:math temp_s2

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.parametric_equation_particle.to_rev_polish_notation.end","fallback": "\u00A77\u00A7o参数方程：表达式转换完成"}
