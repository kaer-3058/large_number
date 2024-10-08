data modify storage large_number:timestamp timestamp_base64 set from block -29999982 -60 22022222
data modify storage large_number:timestamp timestamp_base64 set string storage large_number:timestamp timestamp_base64.profile.properties[0].value 24 38

#只取base64中可解析为时间戳的部分进行解码
data modify storage large_number:math s1 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math s0 set from storage large_number:timestamp timestamp

##解码核心
#每四个字符为一组，进行解码
data modify storage large_number:math temp1 set string storage large_number:timestamp timestamp_base64 0 1
data modify storage large_number:math temp2 set string storage large_number:timestamp timestamp_base64 1 2
data modify storage large_number:math temp3 set string storage large_number:timestamp timestamp_base64 2 3
data modify storage large_number:math temp4 set string storage large_number:timestamp timestamp_base64 3 4
execute store result score #temp1 int run function large_number:timestamp/macro.1.base64_to_index/1 with storage large_number:math
execute store result score #temp2 int run function large_number:timestamp/macro.1.base64_to_index/2 with storage large_number:math
execute store result score #temp3 int run function large_number:timestamp/macro.1.base64_to_index/3 with storage large_number:math
execute store result score #temp4 int run function large_number:timestamp/macro.1.base64_to_index/4 with storage large_number:math
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 int 1000000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 int 1000000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #temp3 int 1000000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #temp4 int 1000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:timestamp/macro.2.01string_4_merge_to_1 with storage large_number:math
data modify storage large_number:math s1[0].a set string storage large_number:math y4 0 8
data modify storage large_number:math s1[1].a set string storage large_number:math y4 8 16
data modify storage large_number:math s1[2].a set string storage large_number:math y4 16 24

data modify storage large_number:math temp1 set string storage large_number:timestamp timestamp_base64 4 5
data modify storage large_number:math temp2 set string storage large_number:timestamp timestamp_base64 5 6
data modify storage large_number:math temp3 set string storage large_number:timestamp timestamp_base64 6 7
data modify storage large_number:math temp4 set string storage large_number:timestamp timestamp_base64 7 8
execute store result score #temp1 int run function large_number:timestamp/macro.1.base64_to_index/1 with storage large_number:math
execute store result score #temp2 int run function large_number:timestamp/macro.1.base64_to_index/2 with storage large_number:math
execute store result score #temp3 int run function large_number:timestamp/macro.1.base64_to_index/3 with storage large_number:math
execute store result score #temp4 int run function large_number:timestamp/macro.1.base64_to_index/4 with storage large_number:math
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 int 1000000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 int 1000000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #temp3 int 1000000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #temp4 int 1000000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:timestamp/macro.2.01string_4_merge_to_1 with storage large_number:math
data modify storage large_number:math s1[3].a set string storage large_number:math y4 0 8
data modify storage large_number:math s1[4].a set string storage large_number:math y4 8 16
data modify storage large_number:math s1[5].a set string storage large_number:math y4 16 24

data modify storage large_number:math s1[{a:"00110000"}] set value {a:0}
data modify storage large_number:math s1[{a:"00110001"}] set value {a:1}
data modify storage large_number:math s1[{a:"00110010"}] set value {a:2}
data modify storage large_number:math s1[{a:"00110011"}] set value {a:3}
data modify storage large_number:math s1[{a:"00110100"}] set value {a:4}
data modify storage large_number:math s1[{a:"00110101"}] set value {a:5}
data modify storage large_number:math s1[{a:"00110110"}] set value {a:6}
data modify storage large_number:math s1[{a:"00110111"}] set value {a:7}
data modify storage large_number:math s1[{a:"00111000"}] set value {a:8}
data modify storage large_number:math s1[{a:"00111001"}] set value {a:9}
data modify storage large_number:timestamp timestamp_decoded_base64 append from storage large_number:math s1[].a


#解码完成了,把时间戳解密为日期
execute if data storage large_number:timestamp timestamp_base64 unless score #timestamp.get_num int matches 2 run function large_number:timestamp/cb_start.2

execute if score #timestamp.get_num int matches 1.. run function large_number:timestamp/get_num

scoreboard players set #cb_run_func:"timestamp/cb_start" int 0

data modify storage large_number:math output_base64_json_GMT+- set value "+"
execute if score #GMT-time_zone int matches ..0 run data modify storage large_number:math output_base64_json_GMT+- set value ""

execute unless score #GMT-time_zone int matches 8 run data modify storage large_number:math output_base64_json_tellraw set value '[{"text":"现在是：GMT"},{"nbt":"output_base64_json_GMT+-","storage":"large_number:math"},{"score":{"name":"#GMT-time_zone","objective":"int"}},{"text":" "},{"score":{"name":"#timestamp_year","objective":"int"}},{"text":"年"},{"score":{"name":"#timestamp_month","objective":"int"}},{"text":"月"},{"score":{"name":"#timestamp_day","objective":"int"}},{"text":"日，"},{"nbt":"output_day_Hour","storage":"large_number:timestamp"},{"text":"时"},{"nbt":"output_day_Minute","storage":"large_number:timestamp"},{"text":"分"},{"nbt":"output_day_Second","storage":"large_number:timestamp"},{"text":"秒"}]'
execute if score #GMT-time_zone int matches 8 run data modify storage large_number:math output_base64_json_tellraw set value '[{"text":"现在是：北京时间(GMT+8) "},{"score":{"name":"#timestamp_year","objective":"int"}},{"text":"年"},{"score":{"name":"#timestamp_month","objective":"int"}},{"text":"月"},{"score":{"name":"#timestamp_day","objective":"int"}},{"text":"日，"},{"nbt":"output_day_Hour","storage":"large_number:timestamp"},{"text":"时"},{"nbt":"output_day_Minute","storage":"large_number:timestamp"},{"text":"分"},{"nbt":"output_day_Second","storage":"large_number:timestamp"},{"text":"秒"}]'

#tellraw @a {"nbt":"output_base64_json_tellraw","storage":"large_number:math","interpret":true}
