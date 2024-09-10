#滑动窗口，用于把数字项出来，遇到非数字的字符就停下来
data modify storage large_number:math sstemp2 set from storage large_number:math sstemp1
scoreboard players set #string_end_ int 0
execute unless data storage large_number:math {sstemp2:""} run function large_number:expression_evaluation_scientific/loop2

#用函数宏法取数字
data modify storage large_number:math s11 set value ""
execute store result storage large_number:math s1 int 1 run scoreboard players get #string_end_ int
execute unless score #string_end_ int matches 0 run function large_number:expression_evaluation_scientific/macro1 with storage large_number:math

#合并完成后直接把数字压入s2栈
execute unless data storage large_number:math {s11:""} run data modify storage large_number:math temp_s2 append from storage large_number:math s11

#把变量也压入栈
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
data modify storage large_number:math sstemp07_786 set value ["α","β","δ","ε","η","λ","μ","ξ","τ","ω","π","ｅ","γ","ｘ","ｙ","ｚ"]
scoreboard players set #temp1 int 16
execute store result score #temp1 int run data modify storage large_number:math sstemp07_786[] set from storage large_number:math stemp1
execute unless score #temp1 int matches 16 run data modify storage large_number:math temp_s2 append from storage large_number:math stemp1
execute unless score #temp1 int matches 16 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 1

#此时第一个子递归已经停止了，表示如果输入的字符串还有字符则一定是计算符，在计算符入栈前先判断该符号的优先级是否大于s1栈顶的计算符(忽略括号)
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {stemp1:"－"} run data modify storage large_number:math stemp1 set value "-"
scoreboard players reset #set int
execute if data storage large_number:math {stemp1:"+"} run scoreboard players set #set int 0
execute if data storage large_number:math {stemp1:"-"} run scoreboard players set #set int 0
execute if data storage large_number:math {stemp1:"*"} run scoreboard players set #set int 1
execute if data storage large_number:math {stemp1:"·"} run scoreboard players set #set int 1
execute if data storage large_number:math {stemp1:"/"} run scoreboard players set #set int 1
execute if data storage large_number:math {stemp1:"^"} run scoreboard players set #set int 2
execute if data storage large_number:math {stemp1:"²"} run scoreboard players set #set int 2
data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
execute if data storage large_number:math {stemp9:"－"} run data modify storage large_number:math stemp9 set value "-"
scoreboard players reset #set_-1 int
execute if data storage large_number:math {stemp9:"+"} run scoreboard players set #set_-1 int 0
execute if data storage large_number:math {stemp9:"-"} run scoreboard players set #set_-1 int 0
execute if data storage large_number:math {stemp9:"*"} run scoreboard players set #set_-1 int 1
execute if data storage large_number:math {stemp9:"·"} run scoreboard players set #set_-1 int 1
execute if data storage large_number:math {stemp9:"/"} run scoreboard players set #set_-1 int 1
execute if data storage large_number:math {stemp9:"^"} run scoreboard players set #set_-1 int 2
execute if data storage large_number:math {stemp9:"²"} run scoreboard players set #set_-1 int 2

#如果优先级不大于s1栈顶的优先级则把s1栈顶的运算符都弹出来压到s2栈，直到要入栈的运算符的优先级大于栈顶运算符
execute if score #set int matches -2147483648.. if score #set_-1 int matches -2147483648.. unless score #set int > #set_-1 int run function large_number:expression_evaluation_scientific/loop4

#优先级判断完毕，如果输入的运算符或函数不是右括号则压入s1栈
data modify storage large_number:math stemp1 set value ""
scoreboard players set #sstemp1 int 0
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {stemp1:"－"} run data modify storage large_number:math stemp1 set value "-"
execute if data storage large_number:math {stemp1:"+"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"-"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"*"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"·"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"/"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"("} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"^"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"²"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"√"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"Γ"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"┕"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"—"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"ψ"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 2
execute if data storage large_number:math {stemp1:"ln"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"||"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"[]"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:">="} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"<="} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"=="} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"≈≈"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:">>"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"<<"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"≥≥"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"≤≤"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 3
execute if data storage large_number:math {stemp1:"exp"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"log"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"sin"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"cos"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"sgn"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"[0]"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:">/<"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:">-<"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 4
execute if data storage large_number:math {stemp1:"atan"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 6
execute if data storage large_number:math {stemp1:"arcsin"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"arccos"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"arctan"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 7
execute if data storage large_number:math {stemp1:"eunorm₂"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"eunorm₃"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 8
execute if data storage large_number:math {stemp1:"Σ[1/n]n→"} run scoreboard players set #sstemp1 int 1
execute if score #sstemp1 int matches 0 run data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 9
execute if data storage large_number:math {stemp1:"ºLambertW"} run scoreboard players set #sstemp1 int 1
execute if data storage large_number:math {stemp1:"¹LambertW"} run scoreboard players set #sstemp1 int 1

scoreboard players set #length1 int 1
execute if score #sstemp1 int matches 1 store result score #length1 int run data get storage large_number:math stemp1
execute if score #sstemp1 int matches 1 run data modify storage large_number:math temp_s1 append from storage large_number:math stemp1

#如果遇到了右括号且这个括号不是空括号，则把接下来把s1栈顶的运算符都送到s2栈，直到遇到左括号，并扔掉遇到的第一个左括号和所有的右括号
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math sstemp1 0 1
data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
scoreboard players set #test2 int 0
execute if data storage large_number:math {stemp1:")"} run function large_number:expression_evaluation_scientific/loop3

#只有执行过遇到了括号时执行的操作才把s1栈顶的左括号删掉
execute if score #test2 int matches 1 if data storage large_number:math {stemp9:"("} run data remove storage large_number:math temp_s1[-1]

execute if score #length1 int matches 1 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 1
execute if score #length1 int matches 2 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 2
execute if score #length1 int matches 3 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 3
execute if score #length1 int matches 4 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 4
execute if score #length1 int matches 6 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 6
execute if score #length1 int matches 7 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 7
execute if score #length1 int matches 8 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 8
execute if score #length1 int matches 9 run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 9
execute unless data storage large_number:math {sstemp1:""} run function large_number:expression_evaluation_scientific/loop1
