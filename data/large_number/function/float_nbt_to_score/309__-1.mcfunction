function large_number:float_nbt_to_score/macro.get_number with storage large_number:math
execute store result score #float_int0 large_number.int run data get storage large_number:math temp2 -10000000.0
scoreboard players operation #float_exp large_number.int = #__exp large_number.int
scoreboard players add #float_exp large_number.int 1

#这样限制的原因：
## 2024.11.13 \
调整了"double转int - 记分板格式，精度为8位有效数字"功能中"四叉树取数法"算法，输出的最小值现在是1E-308，以适配相关的算法需求。
#execute if score #float_exp large_number.int matches ..-309 run scoreboard players set #float_exp large_number.int -308
