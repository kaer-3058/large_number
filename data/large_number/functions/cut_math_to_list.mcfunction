#备份输入数字
scoreboard players operation #inp int = input int

#正为0，负为1，并取输入值的绝对值
scoreboard players set #sign int 0
execute store success score #sign int if score #inp int matches ..-1 run scoreboard players operation #inp int *= -1 const

#拆位
execute store result score #1st int store result score #2nd int run scoreboard players operation #3rd int = #inp int
scoreboard players operation #3rd int %= 10000 const
scoreboard players operation #2nd int %= 100000000 const
scoreboard players operation #2nd int /= 10000 const
scoreboard players operation #1st int /= 100000000 const
