#滑动窗口，用于把数字项出来，遇到非数字的字符就停下来
data modify storage large_number:math sstemp2 set from storage large_number:math sstemp1
scoreboard players set #string_end_ int 0
execute unless data storage large_number:math {sstemp2:""} run function large_number:expression_evaluation/loop2

#用函数宏法取数字
data modify storage large_number:math s11 set value ""
execute store result storage large_number:math s1 int 1 run scoreboard players get #string_end_ int
execute unless score #string_end_ int matches 0 run function large_number:expression_evaluation/macro1 with storage large_number:math

#合并完成后直接把数字压入s2栈
execute unless data storage large_number:math {s11:""} run data modify storage large_number:math temp_s2 append from storage large_number:math s11

#此时第一个子递归已经停止了，表示如果输入的字符串还有字符则一定是计算符，在计算符入栈前先判断该符号的优先级是否大于s1栈顶的计算符(忽略括号)
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {stemp1:"－"} run data modify storage large_number:math stemp1 set value "-"
scoreboard players reset #set int
execute if data storage large_number:math {stemp1:"+"} run scoreboard players set #set int 0
execute if data storage large_number:math {stemp1:"-"} run scoreboard players set #set int 0
execute if data storage large_number:math {stemp1:"*"} run scoreboard players set #set int 1
execute if data storage large_number:math {stemp1:"/"} run scoreboard players set #set int 1
data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
execute if data storage large_number:math {stemp9:"－"} run data modify storage large_number:math stemp9 set value "-"
scoreboard players reset #set_-1 int
execute if data storage large_number:math {stemp9:"+"} run scoreboard players set #set_-1 int 0
execute if data storage large_number:math {stemp9:"-"} run scoreboard players set #set_-1 int 0
execute if data storage large_number:math {stemp9:"*"} run scoreboard players set #set_-1 int 1
execute if data storage large_number:math {stemp9:"/"} run scoreboard players set #set_-1 int 1

#如果优先级不大于s1栈顶的优先级则把s1栈顶的运算符都弹出来压到s2栈，直到要入栈的运算符的优先级大于栈顶运算符
execute if score #set int matches -2147483648.. if score #set_-1 int matches -2147483648.. unless score #set int > #set_-1 int run function large_number:expression_evaluation/loop4

#优先级判断完毕，如果输入的运算符不是右括号则把运算符压入s1栈
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {stemp1:"－"} run data modify storage large_number:math stemp1 set value "-"
execute unless data storage large_number:math {stemp1:")"} run data modify storage large_number:math temp_s1 append from storage large_number:math stemp1

#如果遇到了右括号且这个括号不是空括号，则把接下来把s1栈顶的运算符都送到s2栈，直到遇到左括号，并扔掉遇到的第一个左括号和所有的右括号
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
scoreboard players set #test2 int 0
execute if data storage large_number:math {stemp1:")"} run function large_number:expression_evaluation/loop3

#只有执行过遇到了括号时执行的操作才把s1栈顶的左括号删掉
execute if score #test2 int matches 1 if data storage large_number:math {stemp9:"("} run data remove storage large_number:math temp_s1[-1]

data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 1
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation/loop1
