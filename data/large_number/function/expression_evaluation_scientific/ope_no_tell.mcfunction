#解析逆波兰式 - 实函数

data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
scoreboard players set #temp_expression_evaluation_error large_number.int -1
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math

execute store result storage large_number:math expression_evaluation.error_type int 1 run scoreboard players get #temp_expression_evaluation_error large_number.int
execute if score #temp_expression_evaluation_error large_number.int matches 1.. run data modify storage large_number:math expression_evaluation.output set value "NaNd"

#execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.expression_evaluation.end","fallback": "\u00A77\u00A7o表达式解析完成"}


#报错代码：

#-1：正常
#1001：除数不能为零
#1002：底数为负且指数非整数的幂在浮点数层面无法求
#1003：对数的真数必须是正数，且底数不能为0或1
#1004：反正弦只能定义在区间[-1,1]
#1005：反余弦只能定义在区间[-1,1]
#1006：自然对数只能对正数有定义
#1007：负数无平方根
#1008：逆伽玛函数定义在x≥0.8856031944109
#1009：LambertW函数的主分支的定义域是x≥-0.367879443
#1010：LambertW函数的-1的分支的定义域是区间[-0.367879443,0)
#1011：Digamma函数对0或负整数无定义
#1012：伽玛函数对0或负整数无定义
#1013：对数伽马函数对0或负整数无定义，若对非负整数是以1为长度的区间划分，则函数对偶数序号区间有定义
#1014：贝塔函数中，a、b或a+b等于"0或负整数"
