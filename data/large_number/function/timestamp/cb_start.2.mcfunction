##unix时间戳解析

execute store result score #temp1 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[0] 10000000
execute store result score #temp2 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[1] 1000000
execute store result score #temp3 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[2] 100000
execute store result score #temp4 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[3] 10000
execute store result score #temp5 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[4] 1000
execute store result score #temp6 large_number.int run data get storage large_number:timestamp timestamp_decoded_base64[5] 100
scoreboard players operation #temp1 large_number.int += #temp2 large_number.int
scoreboard players operation #temp1 large_number.int += #temp3 large_number.int
scoreboard players operation #temp1 large_number.int += #temp4 large_number.int
scoreboard players operation #temp1 large_number.int += #temp5 large_number.int
scoreboard players operation #temp1 large_number.int += #temp6 large_number.int
#tellraw @a {"score": {"name": "#temp1","objective": "large_number.int"}}

#秒数变成小时数
scoreboard players operation #temp1 large_number.int /= 36 const

#修正时差  北京属于GMT+8:00，所以+8
execute unless score #GMT-time_zone large_number.int matches ..2147483647 run scoreboard players set #GMT-time_zone large_number.int 8
scoreboard players operation #temp1 large_number.int += #GMT-time_zone large_number.int

#变为天数
scoreboard players operation #temp1 large_number.int /= 24 const
scoreboard players add #temp1 large_number.int 1

#计算从1970.1.1 00:00:00 过去的年数
scoreboard players set #temp2 large_number.int 2023
scoreboard players remove #temp1 large_number.int 19358
execute if score #temp1 large_number.int matches 1461.. run function large_number:timestamp/loop.years_math
execute if score #temp1 large_number.int matches 365.. run function large_number:timestamp/loop.years_math2

#确定年份，测试是否为闰年
scoreboard players operation #timestamp_year large_number.int = #temp2 large_number.int
scoreboard players operation #temp2 large_number.int %= 4 const
execute store success score #is_leap_year large_number.int if score #temp2 large_number.int matches 0

#确定月份
execute if score #is_leap_year large_number.int matches 0 run function large_number:timestamp/cb_start.2.unless_leap_year
execute if score #is_leap_year large_number.int matches 1 run function large_number:timestamp/cb_start.2.is_leap_year
execute store result score #timestamp_month large_number.int run data get storage large_number:math temp1

#月份确定后就是日期数了，已过去的天数+1就是当天的日期
scoreboard players operation #timestamp_day large_number.int = #temp1 large_number.int

#用命令方块获取时分秒
data modify storage large_number:math sstemp1 set string block -29999984 -60 22022222 LastOutput.text 1 -1
data modify storage large_number:timestamp output_day_Hour set string storage large_number:math sstemp1 0 2
data modify storage large_number:timestamp output_day_Minute set string storage large_number:math sstemp1 3 5
data modify storage large_number:timestamp output_day_Second set string storage large_number:math sstemp1 6 8
