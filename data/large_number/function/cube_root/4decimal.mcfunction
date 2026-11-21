##立方根 - 四位小数

scoreboard players operation #inp large_number.int = #cbrt.input large_number.int
scoreboard players set #is- large_number.int 1
execute if score #inp large_number.int matches ..-1 run scoreboard players set #is- large_number.int -1
execute if score #inp large_number.int matches ..-1 run scoreboard players operation #inp large_number.int *= -1 const
scoreboard players operation #temp2 large_number.int = #inp large_number.int

execute if score #temp2 large_number.int matches 1..9 run scoreboard players operation #inp large_number.int *= 100000000 const
execute if score #temp2 large_number.int matches 10..999 run scoreboard players operation #inp large_number.int *= 1000000 const
execute if score #temp2 large_number.int matches 1000..99999 run scoreboard players operation #inp large_number.int *= 10000 const
execute if score #temp2 large_number.int matches 100000..9999999 run scoreboard players operation #inp large_number.int *= 100 const

execute if score #inp large_number.int matches 2..217081800 store result score #cbrt.output large_number.int run function large_number:cube_root/inte/1..20
execute if score #inp large_number.int matches 217081801.. store result score #cbrt.output large_number.int run function large_number:cube_root/inte/21..43

#立方根估值算法
#常数x，n是x的立方根整数部分，z是立方根小数部分
#(x-n^3)/(3n^2 +3n+1)≈z
scoreboard players operation #x large_number.int = #inp large_number.int
execute store result score #n^2 large_number.int run scoreboard players operation #n large_number.int = #cbrt.output large_number.int
execute store result score #n^3 large_number.int run scoreboard players operation #n^2 large_number.int *= #n large_number.int
scoreboard players operation #n^3 large_number.int *= #n large_number.int
scoreboard players operation #n^2 large_number.int *= 3 const
scoreboard players operation #n large_number.int *= 3 const

#分子
scoreboard players operation #x large_number.int -= #n^3 large_number.int

#分母
scoreboard players operation #n^2 large_number.int += #n large_number.int
scoreboard players add #n^2 large_number.int 1

#模除
execute store result score #temp1 large_number.int run scoreboard players operation #x large_number.int *= 100 const
scoreboard players operation #x large_number.int /= #n^2 large_number.int
scoreboard players operation #temp1 large_number.int %= #n^2 large_number.int
scoreboard players operation #temp1 large_number.int *= 100 const
scoreboard players operation #temp1 large_number.int /= #n^2 large_number.int
scoreboard players operation #x large_number.int *= 100 const
scoreboard players operation #x large_number.int += #temp1 large_number.int

scoreboard players operation #cbrt.output large_number.int *= 10000 const
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #cbrt.output large_number.int += #x large_number.int

execute if score #temp2 large_number.int matches 1..9 store result storage large_number:math temp1 int 0.002154434690032 run scoreboard players get #cbrt.output large_number.int
execute if score #temp2 large_number.int matches 10..999 store result storage large_number:math temp1 int 0.01 run scoreboard players get #cbrt.output large_number.int
execute if score #temp2 large_number.int matches 1000..99999 store result storage large_number:math temp1 int 0.0464158883361 run scoreboard players get #cbrt.output large_number.int
execute if score #temp2 large_number.int matches 100000..9999999 store result storage large_number:math temp1 int 0.2154434690032 run scoreboard players get #cbrt.output large_number.int

execute store result score #cbrt.output large_number.int run data get storage large_number:math temp1

scoreboard players operation #cbrt.output large_number.int *= #is- large_number.int
execute if score #cbrt.input large_number.int matches -1..1 run scoreboard players operation #cbrt.output large_number.int = #cbrt.input large_number.int
execute if score #cbrt.input large_number.int matches -1..1 run scoreboard players operation #cbrt.output large_number.int *= 10000 const
execute if score #cbrt.input large_number.int matches -2147483648 run scoreboard players set #cbrt.output large_number.int -12901591
