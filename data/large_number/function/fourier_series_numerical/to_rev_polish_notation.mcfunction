##表达式求值 - 科学计算 - 无提示版

#输入：data modify storage large_number:math expression_evaluation.input set value "(12+14)*(106－32)"

#拆字符串，把符号和数字拆开，然后转化为逆波兰式
#逆波兰式算法：https://blog.csdn.net/zm_miner/article/details/115324206

#temp_s1和temp_s2是事先分配的两个栈
data modify storage large_number:math temp_s1 set value []
data modify storage large_number:math temp_s2 set value []
data modify storage large_number:math sstemp1 set from storage large_number:math expression_evaluation.input
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation_scientific/loop1

#如果s1栈里还有剩余字符则一并取出
execute if data storage large_number:math temp_s1[-1] run function large_number:expression_evaluation_scientific/loop5

data modify storage large_number:math expression_evaluation.rev_polish_notation set from storage large_number:math temp_s2


#tellraw @a {"text":"\u00A77\u00A7o表达式转换完成"}

#tellraw @a {"nbt":"expression_evaluation.rev_polish_notation[]","storage":"large_number:math","separator":" "}
