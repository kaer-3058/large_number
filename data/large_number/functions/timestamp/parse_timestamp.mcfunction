##unix时间戳解析 - 32位

#输入：data modify storage large_number:math parse_timestamp.input set value 1725707220

execute store result score #parse_timestamp.Second int store result score #temp1 int run data get storage large_number:math parse_timestamp.input

#秒数变成小时数
scoreboard players operation #temp1 int /= 3600 const

#修正时差  北京属于GMT+8:00，所以+8
execute unless score #GMT-time_zone int matches ..2147483647 run scoreboard players set #GMT-time_zone int 8
execute store result score #parse_timestamp.Hour int run scoreboard players operation #temp1 int += #GMT-time_zone int

#变为天数
scoreboard players operation #temp1 int /= 24 const
scoreboard players add #temp1 int 1

#计算从1970.1.1 00:00:00 过去的年数
scoreboard players set #temp2 int 1970
execute if score #temp1 int matches 1461.. run function large_number:timestamp/loop.years_math
execute if score #temp1 int matches 365.. run function large_number:timestamp/loop.years_math2

#确定年份，测试是否为闰年
scoreboard players operation #parse_timestamp.year int = #temp2 int
scoreboard players operation #temp2 int %= 4 const
execute store success score #is_leap_year int if score #temp2 int matches 0

#确定月份
execute if score #is_leap_year int matches 0 run function large_number:timestamp/cb_start.2.unless_leap_year
execute if score #is_leap_year int matches 1 run function large_number:timestamp/cb_start.2.is_leap_year
execute store result score #parse_timestamp.month int run data get storage large_number:math temp1

#月份确定后就是日期数了，已过去的天数+1就是当天的日期
scoreboard players operation #parse_timestamp.day int = #temp1 int

#计算时间
execute store result score #parse_timestamp.Minute int run scoreboard players operation #parse_timestamp.Second int %= 3600 const
scoreboard players operation #parse_timestamp.Minute int /= 60 const
execute store result storage large_number:math temp_minute int 1 run scoreboard players add #parse_timestamp.Minute int 100
scoreboard players operation #parse_timestamp.Second int %= 60 const
execute store result storage large_number:math temp_second int 1 run scoreboard players add #parse_timestamp.Second int 100
scoreboard players operation #parse_timestamp.Hour int %= 24 const
execute store result storage large_number:math temp_hour int 1 run scoreboard players add #parse_timestamp.Hour int 100
data modify storage large_number:math parse_timestamp.hour set string storage large_number:math temp_hour 1
data modify storage large_number:math parse_timestamp.minute set string storage large_number:math temp_minute 1
data modify storage large_number:math parse_timestamp.second set string storage large_number:math temp_second 1

data modify storage large_number:math parse_timestamp.GMT+- set value "+"
execute if score #GMT-time_zone int matches ..0 run data modify storage large_number:math parse_timestamp.GMT+- set value ""


execute unless score #GMT-time_zone int matches 8 run data modify storage large_number:math parse_timestamp.tellraw set value '[{"text":"解析结果：GMT"},{"nbt":"parse_timestamp.GMT+-","storage":"large_number:math"},{"score":{"name":"#GMT-time_zone","objective":"int"}},{"text":" "},{"score":{"name":"#parse_timestamp.year","objective":"int"}},{"text":"年"},{"score":{"name":"#parse_timestamp.month","objective":"int"}},{"text":"月"},{"score":{"name":"#parse_timestamp.day","objective":"int"}},{"text":"日，"},{"nbt":"parse_timestamp.hour","storage":"large_number:math"},{"text":"时"},{"nbt":"parse_timestamp.minute","storage":"large_number:math"},{"text":"分"},{"nbt":"parse_timestamp.second","storage":"large_number:math"},{"text":"秒"}]'
execute if score #GMT-time_zone int matches 8 run data modify storage large_number:math parse_timestamp.tellraw set value '[{"text":"解析结果：北京时间(GMT+8) "},{"score":{"name":"#parse_timestamp.year","objective":"int"}},{"text":"年"},{"score":{"name":"#parse_timestamp.month","objective":"int"}},{"text":"月"},{"score":{"name":"#parse_timestamp.day","objective":"int"}},{"text":"日，"},{"nbt":"parse_timestamp.hour","storage":"large_number:math"},{"text":"时"},{"nbt":"parse_timestamp.minute","storage":"large_number:math"},{"text":"分"},{"nbt":"parse_timestamp.second","storage":"large_number:math"},{"text":"秒"}]'

#tellraw @a {"nbt":"parse_timestamp.tellraw","storage":"large_number:math","interpret":true}
