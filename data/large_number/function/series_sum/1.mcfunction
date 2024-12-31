##级数求和 - 数值方法

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取被求和变量为ｘ。

#求和起始值：scoreboard players set #series_sum.min int 1
#求和结束值：scoreboard players set #series_sum.max int 100
#求和步长(至少为1)：scoreboard players set #series_sum.step int 1
#单tick求和项数(不可小于1)：scoreboard players set #series_sum.loops int 2
#开始信号：scoreboard players set #series_sum.start int 1
#求和区间不应超出函数实际允许的输入值范围
#当心数值方法造成的浮点误差累积

#求和完成会在聊天框有提示

#需要tick执行：function large_number:series_sum/tick

tellraw @a {"translate":"large_number.series_sum.diff_start","fallback":"\u00A77\u00A7o级数求和开始"}

data modify storage large_number:math series_sum_sum set value []

scoreboard players operation #temp_series_sum.loop int = #series_sum.min int
scoreboard players set #series_sum.start int 2

#title @a actionbar [{"score":{"name":"#temp_series_sum.loop","objective":"int"}},"/",{"score":{"name":"#series_sum.max","objective":"int"}}]
