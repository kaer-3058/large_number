##级数求和 - 数值方法

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取被求和变量为ｘ。

#单tick求和项数(不可小于1)：scoreboard players set #series_sum.of_score.loops int 2
#开始信号：scoreboard players set #series_sum.of_array.start int 1
#求和区间不应超出函数实际允许的输入值范围
#当心数值方法造成的浮点误差累积

#求和完成会在聊天框有提示

#求和数列 (double列表)：data modify storage large_number:math series_sum_of_array set value [8.0 ,13.0 ,16.0 ,-3.0 ,2.0 ,8.0 ,7.0 ,7.2 ,1.0 ,12.0 ]

#需要tick执行：function large_number:series_sum/of_array/tick

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.series_sum.diff_start","fallback":"\u00A77\u00A7o级数求和开始"}

data modify storage large_number:math series_sum_sum set value []

scoreboard players set #temp_series_sum.of_array.loop int 0
execute store result score #series_sum.of_score.max int run data get storage large_number:math series_sum_of_array
data modify storage large_number:math temp_series_sum_of_array set from storage large_number:math series_sum_of_array
scoreboard players set #series_sum.of_array.start int 2

#title @a actionbar [{"score":{"name":"#temp_series_sum.of_array.loop","objective":"int"}},"/",{"score":{"name":"#series_sum.of_score.max","objective":"int"}}]
