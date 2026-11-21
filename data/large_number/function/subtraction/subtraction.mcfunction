#判断被减数和减数大小
scoreboard players set #is_> large_number.int 0
execute if score #1.1 large_number.int > #2.1 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.1 large_number.int < #2.1 large_number.int if score #1.2 large_number.int > #2.2 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.1 large_number.int < #2.1 large_number.int unless score #1.2 large_number.int < #2.2 large_number.int if score #1.3 large_number.int > #2.3 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.1 large_number.int < #2.1 large_number.int unless score #1.2 large_number.int < #2.2 large_number.int unless score #1.3 large_number.int < #2.3 large_number.int if score #1.4 large_number.int > #2.4 large_number.int run scoreboard players set #is_> large_number.int 1

#如果被减数比减数小就交换被减数和减数
execute if score #is_> large_number.int matches 0 run scoreboard players operation #1.1 large_number.int >< #2.1 large_number.int
execute if score #is_> large_number.int matches 0 run scoreboard players operation #1.2 large_number.int >< #2.2 large_number.int
execute if score #is_> large_number.int matches 0 run scoreboard players operation #1.3 large_number.int >< #2.3 large_number.int
execute if score #is_> large_number.int matches 0 run scoreboard players operation #1.4 large_number.int >< #2.4 large_number.int
scoreboard players set #4.1 large_number.int 0
execute if score #is_> large_number.int matches 0 store success score #4.1 large_number.int if score #+- large_number.int matches 0 run scoreboard players set #+- large_number.int 1
execute if score #is_> large_number.int matches 0 unless score #4.1 large_number.int matches 1 if score #+- large_number.int matches 1 run scoreboard players set #+- large_number.int 0

#减法
execute if score #1.4 large_number.int < #2.4 large_number.int run scoreboard players remove #1.3 large_number.int 1
execute if score #1.4 large_number.int < #2.4 large_number.int run scoreboard players add #1.4 large_number.int 10000
scoreboard players operation #1.4 large_number.int -= #2.4 large_number.int

execute if score #1.3 large_number.int < #2.3 large_number.int run scoreboard players remove #1.2 large_number.int 1
execute if score #1.3 large_number.int < #2.3 large_number.int run scoreboard players add #1.3 large_number.int 10000
scoreboard players operation #1.3 large_number.int -= #2.3 large_number.int

execute if score #1.2 large_number.int < #2.2 large_number.int run scoreboard players remove #1.1 large_number.int 1
execute if score #1.2 large_number.int < #2.2 large_number.int run scoreboard players add #1.2 large_number.int 10000
scoreboard players operation #1.2 large_number.int -= #2.2 large_number.int

scoreboard players operation #1.1 large_number.int -= #2.1 large_number.int

#如果判断输出的数为负数，则调整结果为负数
execute if score #+- large_number.int matches 1 if score #1.1 large_number.int matches 1.. run scoreboard players operation #1.1 large_number.int *= -1 const
execute if score #+- large_number.int matches 1 unless score #1.1 large_number.int matches ..-1 if score #1.2 large_number.int matches 1.. run scoreboard players operation #1.2 large_number.int *= -1 const
execute if score #+- large_number.int matches 1 unless score #1.1 large_number.int matches ..-1 unless score #1.2 large_number.int matches ..-1 if score #1.3 large_number.int matches 1.. run scoreboard players operation #1.3 large_number.int *= -1 const
execute if score #+- large_number.int matches 1 unless score #1.1 large_number.int matches ..-1 unless score #1.2 large_number.int matches ..-1 unless score #1.3 large_number.int matches ..-1 if score #1.4 large_number.int matches 1.. run scoreboard players operation #1.4 large_number.int *= -1 const

#输出
data modify storage large_number:math subtraction.output set value [I;0,0,0,0,0]
execute store success storage large_number:math subtraction.output[0] int 0.0 store result storage large_number:math subtraction.output[1] int 1.0 run scoreboard players get #1.1 large_number.int
execute store result storage large_number:math subtraction.output[2] int 1.0 run scoreboard players get #1.2 large_number.int
execute store result storage large_number:math subtraction.output[3] int 1.0 run scoreboard players get #1.3 large_number.int
execute store result storage large_number:math subtraction.output[4] int 1.0 run scoreboard players get #1.4 large_number.int
