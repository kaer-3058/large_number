##牛顿迭代法求函数0点

#函数直接取"表达式求值-科学计算"得到的逆波兰式
#输入初值：data modify storage large_number:math newton.s_method.start_value set value 5.0
#迭代次数：data modify storage large_number:math newton.s_method.loops set value 10

#导数的dx值：data modify storage large_number:math expression_evaluation.differential.dx set value 0.004
#dx是一个较小的值，范围是[1, 1E-9]，因浮点误差的存在，此值不可太小，一般选0.01~0.001

#输出：data get storage large_number:math newton.s_method.output

data modify storage large_number:math newton.s_method.function set from storage large_number:math expression_evaluation.input
data modify storage large_number:math newton.s_method.output set from storage large_number:math newton.s_method.start_value
execute store result score #temp_newton.s_method.loops int run data get storage large_number:math newton.s_method.loops
execute if score #temp_newton.s_method.loops int matches 1.. run function large_number:newton.s_method/loop

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate": "large_number.newton.s_method.end","fallback": "\u00A77\u00A7o牛顿迭代法计算完成"}
