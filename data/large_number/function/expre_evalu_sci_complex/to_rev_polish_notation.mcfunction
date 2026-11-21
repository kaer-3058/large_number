##表达式求值 - 科学计算 - 复数计算器

#输入：data modify storage large_number:math expression_evaluation.input set value "(12+14)*(106－32)"
#运算符可接受+－*· /().E-^²。为了在转化为逆波兰式的过程中区分减法与负数，"－"(全角减号)表示减法，"-"(半角减号)表示负数。"·"等价于"*"。空格等价于乘号。
#数字只能是double，不需要带单位。注意，即使是变量与数字相乘，乘号也必须要写。

#function large_number:expre_evalu_sci_complex/to_rev_polish_notation
#function large_number:expre_evalu_sci_complex/ope

#temp_s1和temp_s2是事先分配的两个栈
data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math expression_evaluation.input
execute unless data storage large_number:math {sstemp1:""} run function large_number:expre_evalu_sci_complex/loop1

#如果s1栈里还有剩余字符则一并取出
execute if data storage large_number:math temp_s1[-1] run function large_number:expre_evalu_sci_complex/loop5

data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math temp_s2


execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.expression_evaluation.to_rev_polish_notation.end","fallback": "\u00A77\u00A7o表达式转换完成"}

#tellraw @a {"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
