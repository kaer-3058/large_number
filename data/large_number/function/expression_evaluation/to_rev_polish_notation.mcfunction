##表达式求值 - 四则运算

#输入：data modify storage large_number:math expression_evaluation.input set value "(12+14)*(106－32)"
#符号仅接受+－*/().E-。为了在转化为逆波兰式的过程中区分减法与负数，"－"表示减法，"-"表示负数。数字只能是int或double。double型数值不需要单位，double型数值只能使用浮点数算法计算。

#拆字符串，把符号和数字拆开，然后转化为逆波兰式
#逆波兰式算法：https://blog.csdn.net/zm_miner/article/details/115324206

#temp_s1和temp_s2是事先分配的两个栈
data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math expression_evaluation.input
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation/loop1

#如果s1栈里还有剩余字符则一并取出
execute if data storage large_number:math temp_s1[-1] run function large_number:expression_evaluation/loop5

data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math temp_s2


execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.expression_evaluation.to_rev_polish_notation.end","fallback": "\u00A77\u00A7o表达式转换完成"}

#tellraw @a {"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
