data modify storage large_number:math temp_s2 append from storage large_number:math temp_s1[-1]
data remove storage large_number:math temp_s1[-1]

#以同样的方式再次判断，如果优先级还是不大于则继续递归
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

execute if score #set int matches -2147483648.. if score #set_-1 int matches -2147483648.. unless score #set int > #set_-1 int run function large_number:expression_evaluation_scientific/loop4
