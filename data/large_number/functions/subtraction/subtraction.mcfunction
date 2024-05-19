#判断被减数和减数大小
scoreboard players set #is_> int 0
execute if score #1.1 int > #2.1 int run scoreboard players set #is_> int 1
execute unless score #1.1 int < #2.1 int if score #1.2 int > #2.2 int run scoreboard players set #is_> int 1
execute unless score #1.1 int < #2.1 int unless score #1.2 int < #2.2 int if score #1.3 int > #2.3 int run scoreboard players set #is_> int 1
execute unless score #1.1 int < #2.1 int unless score #1.2 int < #2.2 int unless score #1.3 int < #2.3 int if score #1.4 int > #2.4 int run scoreboard players set #is_> int 1

#如果被减数比减数小就交换被减数和减数
execute if score #is_> int matches 0 run scoreboard players operation #1.1 int >< #2.1 int
execute if score #is_> int matches 0 run scoreboard players operation #1.2 int >< #2.2 int
execute if score #is_> int matches 0 run scoreboard players operation #1.3 int >< #2.3 int
execute if score #is_> int matches 0 run scoreboard players operation #1.4 int >< #2.4 int
scoreboard players set #4.1 int 0
execute if score #is_> int matches 0 store success score #4.1 int if score #+- int matches 0 run scoreboard players set #+- int 1
execute if score #is_> int matches 0 unless score #4.1 int matches 1 if score #+- int matches 1 run scoreboard players set #+- int 0

#减法
execute if score #1.4 int < #2.4 int run scoreboard players remove #1.3 int 1
execute if score #1.4 int < #2.4 int run scoreboard players add #1.4 int 10000
scoreboard players operation #1.4 int -= #2.4 int

execute if score #1.3 int < #2.3 int run scoreboard players remove #1.2 int 1
execute if score #1.3 int < #2.3 int run scoreboard players add #1.3 int 10000
scoreboard players operation #1.3 int -= #2.3 int

execute if score #1.2 int < #2.2 int run scoreboard players remove #1.1 int 1
execute if score #1.2 int < #2.2 int run scoreboard players add #1.2 int 10000
scoreboard players operation #1.2 int -= #2.2 int

scoreboard players operation #1.1 int -= #2.1 int

#如果判断输出的数为负数，则调整结果为负数
execute if score #+- int matches 1 if score #1.1 int matches 1.. run scoreboard players operation #1.1 int *= -1 const
execute if score #+- int matches 1 unless score #1.1 int matches ..-1 if score #1.2 int matches 1.. run scoreboard players operation #1.2 int *= -1 const
execute if score #+- int matches 1 unless score #1.1 int matches ..-1 unless score #1.2 int matches ..-1 if score #1.3 int matches 1.. run scoreboard players operation #1.3 int *= -1 const
execute if score #+- int matches 1 unless score #1.1 int matches ..-1 unless score #1.2 int matches ..-1 unless score #1.3 int matches ..-1 if score #1.4 int matches 1.. run scoreboard players operation #1.4 int *= -1 const

#输出
data modify storage large_number:math subtraction.output set value [I;0,0,0,0,0]
execute store success storage large_number:math subtraction.output[0] int 0.0 store result storage large_number:math subtraction.output[1] int 1.0 run scoreboard players get #1.1 int
execute store result storage large_number:math subtraction.output[2] int 1.0 run scoreboard players get #1.2 int
execute store result storage large_number:math subtraction.output[3] int 1.0 run scoreboard players get #1.3 int
execute store result storage large_number:math subtraction.output[4] int 1.0 run scoreboard players get #1.4 int
