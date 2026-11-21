##unix时间戳解析 - 32位

#输入：data modify storage large_number:math parse_timestamp.input set value 1725707220

#function large_number:timestamp/parse_timestamp

execute store result score #parse_timestamp.Second large_number.int store result score #temp1 large_number.int run data get storage large_number:math parse_timestamp.input

#秒数变成小时数
scoreboard players operation #temp1 large_number.int /= 3600 const

#修正时差  北京属于GMT+8:00，所以+8
execute unless score #GMT-time_zone large_number.int matches ..2147483647 run scoreboard players set #GMT-time_zone large_number.int 8
execute store result score #parse_timestamp.Hour large_number.int run scoreboard players operation #temp1 large_number.int += #GMT-time_zone large_number.int

#变为天数
scoreboard players operation #temp1 large_number.int /= 24 const
scoreboard players add #temp1 large_number.int 1

#计算从1970.1.1 00:00:00 过去的年数
scoreboard players set #temp2 large_number.int 1970
execute if score #temp1 large_number.int matches 1461.. run function large_number:timestamp/loop.years_math
execute if score #temp1 large_number.int matches 365.. run function large_number:timestamp/loop.years_math2

#确定年份，测试是否为闰年
scoreboard players operation #parse_timestamp.year large_number.int = #temp2 large_number.int
scoreboard players operation #temp2 large_number.int %= 4 const
execute store success score #is_leap_year large_number.int if score #temp2 large_number.int matches 0

#确定月份
execute if score #is_leap_year large_number.int matches 0 run function large_number:timestamp/cb_start.2.unless_leap_year
execute if score #is_leap_year large_number.int matches 1 run function large_number:timestamp/cb_start.2.is_leap_year
execute store result score #parse_timestamp.month large_number.int run data get storage large_number:math temp1

#月份确定后就是日期数了，已过去的天数+1就是当天的日期
scoreboard players operation #parse_timestamp.day large_number.int = #temp1 large_number.int

#计算时间
execute store result score #parse_timestamp.Minute large_number.int run scoreboard players operation #parse_timestamp.Second large_number.int %= 3600 const
scoreboard players operation #parse_timestamp.Minute large_number.int /= 60 const
execute store result storage large_number:math temp_minute int 1 run scoreboard players add #parse_timestamp.Minute large_number.int 100
scoreboard players operation #parse_timestamp.Second large_number.int %= 60 const
execute store result storage large_number:math temp_second int 1 run scoreboard players add #parse_timestamp.Second large_number.int 100
scoreboard players operation #parse_timestamp.Hour large_number.int %= 24 const
execute store result storage large_number:math temp_hour int 1 run scoreboard players add #parse_timestamp.Hour large_number.int 100
data modify storage large_number:math parse_timestamp.hour set string storage large_number:math temp_hour 1
data modify storage large_number:math parse_timestamp.minute set string storage large_number:math temp_minute 1
data modify storage large_number:math parse_timestamp.second set string storage large_number:math temp_second 1

data modify storage large_number:math parse_timestamp.GMT+- set value "+"
execute if score #GMT-time_zone large_number.int matches ..0 run data modify storage large_number:math parse_timestamp.GMT+- set value ""


execute unless score #GMT-time_zone large_number.int matches 8 run data modify storage large_number:math parse_timestamp.tellraw set value {"translate":"large_number.parse_timestamp.time","fallback":"解析结果：GMT%1$s%2$s %3$s年%4$s月%5$s日，%6$s时%7$s分%8$s秒","with": [{"nbt":"parse_timestamp.GMT+-","storage":"large_number:math"},{"score":{"name":"#GMT-time_zone","objective":"large_number.int"}},{"score":{"name":"#parse_timestamp.year","objective":"large_number.int"}},{"score":{"name":"#parse_timestamp.month","objective":"large_number.int"}},{"score":{"name":"#parse_timestamp.day","objective":"large_number.int"}},{"nbt":"parse_timestamp.hour","storage":"large_number:math"},{"nbt":"parse_timestamp.minute","storage":"large_number:math"},{"nbt":"parse_timestamp.second","storage":"large_number:math"}]}
execute if score #GMT-time_zone large_number.int matches 8 run data modify storage large_number:math parse_timestamp.tellraw set value {"translate":"large_number.parse_timestamp.time.gmt8","fallback":"解析结果：北京时间(GMT+8) %1$s年%2$s月%3$s日，%4$s时%5$s分%6$s秒","with": [{"score":{"name":"#parse_timestamp.year","objective":"large_number.int"}},{"score":{"name":"#parse_timestamp.month","objective":"large_number.int"}},{"score":{"name":"#parse_timestamp.day","objective":"large_number.int"}},{"nbt":"parse_timestamp.hour","storage":"large_number:math"},{"nbt":"parse_timestamp.minute","storage":"large_number:math"},{"nbt":"parse_timestamp.second","storage":"large_number:math"}]}

#tellraw @a {"nbt":"parse_timestamp.tellraw","storage":"large_number:math","interpret":true}
