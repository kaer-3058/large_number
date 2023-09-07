#获取数字
execute store result score #1.3 int run data get storage math addition.input1[2]
execute store result score #1.2 int run data get storage math addition.input1[1]
execute store result score #1.1 int run data get storage math addition.input1[0]
execute store result score #2.3 int run data get storage math addition.input2[2]
execute store result score #2.2 int run data get storage math addition.input2[1]
execute store result score #2.1 int run data get storage math addition.input2[0]

#判断符号
scoreboard players set #+-1 int 0
execute store success score #+-1 int if score #1.3 int matches ..-1 run scoreboard players operation #1.3 int *= -1 const
execute store success score #+-1 int if score #1.2 int matches ..-1 run scoreboard players operation #1.2 int *= -1 const
execute store success score #+-1 int if score #1.1 int matches ..-1 run scoreboard players operation #1.1 int *= -1 const

scoreboard players set #+-2 int 0
execute store success score #+-2 int if score #2.3 int matches ..-1 run scoreboard players operation #2.3 int *= -1 const
execute store success score #+-2 int if score #2.2 int matches ..-1 run scoreboard players operation #2.2 int *= -1 const
execute store success score #+-2 int if score #2.1 int matches ..-1 run scoreboard players operation #2.1 int *= -1 const

scoreboard players set #+- int 0
execute if score #+-1 int = #+-2 int if score #+-1 int matches 1 run scoreboard players set #+- int 1

#同号执行相加，异号执行相减
execute if score #+-1 int = #+-2 int run function large_number:addition/10e12_addition

execute unless score #+-1 int = #+-2 int unless score #+-1 int matches 0 unless score #+-2 int matches 1 run scoreboard players operation #1.1 int >< #2.1 int
execute unless score #+-1 int = #+-2 int unless score #+-1 int matches 0 unless score #+-2 int matches 1 run scoreboard players operation #1.2 int >< #2.2 int
execute unless score #+-1 int = #+-2 int unless score #+-1 int matches 0 unless score #+-2 int matches 1 run scoreboard players operation #1.3 int >< #2.3 int
execute unless score #+-1 int = #+-2 int run function large_number:addition/subtraction_special
