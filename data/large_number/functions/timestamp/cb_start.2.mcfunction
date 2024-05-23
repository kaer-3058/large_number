##unix时间戳解析

data modify storage large_number:math temp1 set string storage large_number:timestamp output_base64_json.timestamp 0 -3
#data modify storage large_number:math temp1 set value 1703778042
function large_number:timestamp/macro.6.string_ro_int with storage large_number:math

#秒数变成小时数
scoreboard players operation #temp1 int /= 3600 const

#修正时差  北京属于GMT+8:00，所以+8
scoreboard players add #temp1 int 8

#变为天数
scoreboard players operation #temp1 int /= 24 const

#计算从1970.1.1 00:00:00 过去的年数
scoreboard players set #temp2 int 1970
function large_number:timestamp/loop.years_math

#确定年份，测试是否为闰年
scoreboard players set #is_leap_year int 0
execute store result score #timestamp_year int run scoreboard players operation #temp3 int = #temp2 int
scoreboard players operation #temp3 int %= 4 const
execute if score #temp3 int matches 0 run scoreboard players set #is_leap_year int 1

#确定月份
execute if score #is_leap_year int matches 0 run function large_number:timestamp/cb_start.2.unless_leap_year
execute if score #is_leap_year int matches 1 run function large_number:timestamp/cb_start.2.is_leap_year

#月份确定后就是日期数了，已过去的天数+1就是当天的日期
execute store result score #timestamp_day int run scoreboard players add #temp1 int 1

#用命令方块获取时分秒
execute in minecraft:overworld run data modify storage large_number:math temp1 set string block -29999984 -60 22022222 LastOutput 10 18
data modify storage large_number:timestamp output_day_Second set string storage large_number:math temp1 6 8
data modify storage large_number:timestamp output_day_Minute set string storage large_number:math temp1 3 5
data modify storage large_number:timestamp output_day_Hour set string storage large_number:math temp1 0 2

function large_number:timestamp/macro.7.get_cb_output_time with storage large_number:timestamp
