##立方根 - 取整

scoreboard players operation #inp large_number.int = #cbrt.input large_number.int
scoreboard players set #is- large_number.int 1
execute if score #inp large_number.int matches ..-1 run scoreboard players set #is- large_number.int -1
execute if score #inp large_number.int matches ..-1 run scoreboard players operation #inp large_number.int *= -1 const

execute if score #inp large_number.int matches 2..217081800 store result score #cbrt.output large_number.int run function large_number:cube_root/inte/1..20
execute if score #inp large_number.int matches 217081801..2147483647 store result score #cbrt.output large_number.int run function large_number:cube_root/inte/21..43

scoreboard players operation #cbrt.output large_number.int *= #is- large_number.int
execute if score #cbrt.input large_number.int matches -2147483648 run scoreboard players set #cbrt.output large_number.int -1290
execute if score #cbrt.input large_number.int matches -1..1 run scoreboard players operation #cbrt.output large_number.int = #cbrt.input large_number.int
