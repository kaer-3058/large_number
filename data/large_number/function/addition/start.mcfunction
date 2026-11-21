##大数加法

#获取数字
execute store result score #1.3 large_number.int run data get storage large_number:math addition.input1[2]
execute store result score #1.2 large_number.int run data get storage large_number:math addition.input1[1]
execute store result score #1.1 large_number.int run data get storage large_number:math addition.input1[0]

execute store result score #2.3 large_number.int run data get storage large_number:math addition.input2[2]
execute store result score #2.2 large_number.int run data get storage large_number:math addition.input2[1]
execute store result score #2.1 large_number.int run data get storage large_number:math addition.input2[0]

#判断符号
scoreboard players set #+-1 large_number.int 0
execute store success score #+-1 large_number.int if score #1.3 large_number.int matches ..-1 run scoreboard players operation #1.3 large_number.int *= -1 const
execute store success score #+-1 large_number.int if score #1.2 large_number.int matches ..-1 run scoreboard players operation #1.2 large_number.int *= -1 const
execute store success score #+-1 large_number.int if score #1.1 large_number.int matches ..-1 run scoreboard players operation #1.1 large_number.int *= -1 const

scoreboard players set #+-2 large_number.int 0
execute store success score #+-2 large_number.int if score #2.3 large_number.int matches ..-1 run scoreboard players operation #2.3 large_number.int *= -1 const
execute store success score #+-2 large_number.int if score #2.2 large_number.int matches ..-1 run scoreboard players operation #2.2 large_number.int *= -1 const
execute store success score #+-2 large_number.int if score #2.1 large_number.int matches ..-1 run scoreboard players operation #2.1 large_number.int *= -1 const

scoreboard players set #+- large_number.int 0
execute if score #+-1 large_number.int = #+-2 large_number.int if score #+-1 large_number.int matches 1 run scoreboard players set #+- large_number.int 1

#同号执行相加，异号执行相减
execute if score #+-1 large_number.int = #+-2 large_number.int run function large_number:addition/10e12_addition

execute unless score #+-1 large_number.int = #+-2 large_number.int unless score #+-1 large_number.int matches 0 unless score #+-2 large_number.int matches 1 run scoreboard players operation #1.1 large_number.int >< #2.1 large_number.int
execute unless score #+-1 large_number.int = #+-2 large_number.int unless score #+-1 large_number.int matches 0 unless score #+-2 large_number.int matches 1 run scoreboard players operation #1.2 large_number.int >< #2.2 large_number.int
execute unless score #+-1 large_number.int = #+-2 large_number.int unless score #+-1 large_number.int matches 0 unless score #+-2 large_number.int matches 1 run scoreboard players operation #1.3 large_number.int >< #2.3 large_number.int
execute unless score #+-1 large_number.int = #+-2 large_number.int run function large_number:addition/subtraction_special
