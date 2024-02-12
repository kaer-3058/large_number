##unix时间戳解析 - 32位

#输入：data modify storage math parse_timestamp.input set value ""

data modify storage math temp1 set from storage math parse_timestamp.input
function large_number:timestamp/parse_timestamp/macro.string_ro_int with storage math

#秒数变成小时数
scoreboard players operation #temp1 int /= 3600 const

#修正时差  北京属于GMT+8:00，所以+8
execute unless score #GMT-time_zone int matches ..2147483647 run scoreboard players set #GMT-time_zone int 8
execute store result score #parse_timestamp.Hour int run scoreboard players operation #temp1 int += #GMT-time_zone int

#变为天数
scoreboard players operation #temp1 int /= 24 const

#计算从1970.1.1 00:00:00 过去的年数
scoreboard players set #temp2 int 1970
function large_number:timestamp/loop.years_math

#确定年份，测试是否为闰年
scoreboard players set #is_leap_year int 0
execute store result score #parse_timestamp.year int run scoreboard players operation #temp3 int = #temp2 int
scoreboard players operation #temp3 int %= 4 const
execute if score #temp3 int matches 0 run scoreboard players set #is_leap_year int 1

#确定月份
execute if score #is_leap_year int matches 0 run function large_number:timestamp/parse_timestamp/unless_leap_year
execute if score #is_leap_year int matches 1 run function large_number:timestamp/parse_timestamp/is_leap_year

#月份确定后就是日期数了，已过去的天数+1就是当天的日期
execute store result score #parse_timestamp.day int run scoreboard players add #temp1 int 1

#计算时间
execute store result score #parse_timestamp.Minute int run scoreboard players operation #parse_timestamp.Second int %= 3600 const
scoreboard players operation #parse_timestamp.Minute int /= 60 const
scoreboard players operation #parse_timestamp.Second int %= 60 const
scoreboard players operation #parse_timestamp.Hour int %= 24 const

data modify storage math parse_timestamp.GMT+- set value "+"
execute if score #GMT-time_zone int matches ..-1 run data modify storage math parse_timestamp.GMT+- set value ""


execute unless score #GMT-time_zone int matches 8 run data modify storage math parse_timestamp.tellraw set value '[{"text":"解析结果：GMT"},{"nbt":"parse_timestamp.GMT+-","storage":"math"},{"score":{"name":"#GMT-time_zone","objective":"int"}},{"text":" "},{"score":{"name":"#parse_timestamp.year","objective":"int"}},{"text":"年"},{"score":{"name":"#parse_timestamp.month","objective":"int"}},{"text":"月"},{"score":{"name":"#parse_timestamp.day","objective":"int"}},{"text":"日，"},{"score":{"name":"#parse_timestamp.Hour","objective":"int"}},{"text":"时"},{"score":{"name":"#parse_timestamp.Minute","objective":"int"}},{"text":"分"},{"score":{"name":"#parse_timestamp.Second","objective":"int"}},{"text":"秒"}]'
execute if score #GMT-time_zone int matches 8 run data modify storage math parse_timestamp.tellraw set value '[{"text":"解析结果：北京时间(GMT+8) "},{"score":{"name":"#parse_timestamp.year","objective":"int"}},{"text":"年"},{"score":{"name":"#parse_timestamp.month","objective":"int"}},{"text":"月"},{"score":{"name":"#parse_timestamp.day","objective":"int"}},{"text":"日，"},{"score":{"name":"#parse_timestamp.Hour","objective":"int"}},{"text":"时"},{"score":{"name":"#parse_timestamp.Minute","objective":"int"}},{"text":"分"},{"score":{"name":"#parse_timestamp.Second","objective":"int"}},{"text":"秒"}]'

#tellraw @a {"nbt":"parse_timestamp.tellraw","storage":"math","interpret":true}
