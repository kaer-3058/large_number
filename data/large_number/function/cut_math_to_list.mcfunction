#备份输入数字
scoreboard players operation #inp large_number.int = #input large_number.int

#正为1，负为-1，并取输入值的绝对值
scoreboard players set #sign large_number.int 1
execute if score #inp large_number.int matches ..-1 run scoreboard players set #sign large_number.int -1
execute if score #inp large_number.int matches -2147483648 run scoreboard players set #inp large_number.int 2147483647
execute if score #inp large_number.int matches ..-1 run scoreboard players operation #inp large_number.int *= -1 const

#拆位
execute store result score #1st large_number.int store result score #2nd large_number.int run scoreboard players operation #3rd large_number.int = #inp large_number.int
scoreboard players operation #3rd large_number.int %= 10000 const
scoreboard players operation #2nd large_number.int %= 100000000 const
scoreboard players operation #2nd large_number.int /= 10000 const
scoreboard players operation #1st large_number.int /= 100000000 const
