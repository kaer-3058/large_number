##立方根 - 取整

scoreboard players operation #inp int = #cbrt.input int
scoreboard players set #is- int 1
execute if score #inp int matches ..-1 run scoreboard players set #is- int -1
execute if score #inp int matches ..-1 run scoreboard players operation #inp int *= -1 const

execute if score #inp int matches 2..217081800 store result score #cbrt.output int run function large_number:cube_root/inte/1..20
execute if score #inp int matches 217081801..2147483647 store result score #cbrt.output int run function large_number:cube_root/inte/21..43

scoreboard players operation #cbrt.output int *= #is- int
execute if score #cbrt.input int matches -2147483648 run scoreboard players set #cbrt.output int -1290
execute if score #cbrt.input int matches -1..1 run scoreboard players operation #cbrt.output int = #cbrt.input int
