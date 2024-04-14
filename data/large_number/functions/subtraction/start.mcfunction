##大数减法

#被减数
execute store result score #1.4 int run data get storage math subtraction.input1[3]
execute store result score #1.3 int run data get storage math subtraction.input1[2]
execute store result score #1.2 int run data get storage math subtraction.input1[1]
execute store result score #1.1 int run data get storage math subtraction.input1[0]

#减数
execute store result score #2.4 int run data get storage math subtraction.input2[3]
execute store result score #2.3 int run data get storage math subtraction.input2[2]
execute store result score #2.2 int run data get storage math subtraction.input2[1]
execute store result score #2.1 int run data get storage math subtraction.input2[0]

#负数相减，0为正，1为负
scoreboard players set #+-1 int 0
execute store success score #+-1 int if score #1.4 int matches ..-1 run scoreboard players operation #1.4 int *= -1 const
execute store success score #+-1 int if score #1.3 int matches ..-1 run scoreboard players operation #1.3 int *= -1 const
execute store success score #+-1 int if score #1.2 int matches ..-1 run scoreboard players operation #1.2 int *= -1 const
execute store success score #+-1 int if score #1.1 int matches ..-1 run scoreboard players operation #1.1 int *= -1 const

scoreboard players set #+-2 int 0
execute store success score #+-2 int if score #2.4 int matches ..-1 run scoreboard players operation #2.4 int *= -1 const
execute store success score #+-2 int if score #2.3 int matches ..-1 run scoreboard players operation #2.3 int *= -1 const
execute store success score #+-2 int if score #2.2 int matches ..-1 run scoreboard players operation #2.2 int *= -1 const
execute store success score #+-2 int if score #2.1 int matches ..-1 run scoreboard players operation #2.2 int *= -1 const

scoreboard players set #+- int 0
execute if score #+-1 int = #+-2 int if score #+-1 int matches 1 run scoreboard players set #+- int 1

#同号执行相减，异号执行相加
execute if score #+-1 int = #+-2 int run function large_number:subtraction/subtraction

#正减负得正，负减正得负。0当正数处理
execute if score #+-1 int matches 0 if score #+-2 int matches 1 run scoreboard players set #+- int 0
execute if score #+-1 int matches 1 if score #+-2 int matches 0 run scoreboard players set #+- int 1
execute unless score #+-1 int = #+-2 int run function large_number:subtraction/10e12_addition_special
