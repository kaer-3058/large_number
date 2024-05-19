execute in minecraft:overworld run data modify storage large_number:timestamp timestamp_base64 set from block -29999982 -60 22022222 SkullOwner.Properties.textures[0].Value
execute store result score #temp9 int run data get storage large_number:timestamp timestamp_base64

function large_number:timestamp/loop

#tellraw @a {"nbt":"timestamp_decoded_base64[]","storage":"large_number:timestamp","separator":{"text":""}}
#到这里解码就完成了，后面是拼字符

data modify storage large_number:math temp3 set from storage large_number:timestamp timestamp_decoded_base64
data modify storage large_number:math temp2 set value ""
function large_number:timestamp/loop.merge_json_string


function large_number:timestamp/macro.5.string_to_compound with storage large_number:math

#输出：data get storage large_number:timestamp output_base64_json
#下面是把时间戳解密为日期

execute if data storage large_number:timestamp output_base64_json.timestamp run function large_number:timestamp/cb_start.2

#tellraw @a [{"text":"现在是：北京时间(GMT+8)\u00A0"},{"score":{"name":"#timestamp_year","objective":"int"}},{"text":"年"},{"score":{"name":"#timestamp_month","objective":"int"}},{"text":"月"},{"score":{"name":"#timestamp_day","objective":"int"}},{"text":"日，"},{"nbt":"output_day_Hour","storage":"large_number:timestamp"},{"text":"时"},{"nbt":"output_day_Minute","storage":"large_number:timestamp"},{"text":"分"},{"nbt":"output_day_Second","storage":"large_number:timestamp"},{"text":"秒"}]

data modify storage large_number:math output_base64_json_tellraw set value '[{"text":"现在是：北京时间(GMT+8) "},{"score":{"name":"#timestamp_year","objective":"int"}},{"text":"年"},{"score":{"name":"#timestamp_month","objective":"int"}},{"text":"月"},{"score":{"name":"#timestamp_day","objective":"int"}},{"text":"日，"},{"nbt":"output_day_Hour","storage":"large_number:timestamp"},{"text":"时"},{"nbt":"output_day_Minute","storage":"large_number:timestamp"},{"text":"分"},{"nbt":"output_day_Second","storage":"large_number:timestamp"},{"text":"秒"}]'

#tellraw @a {"nbt":"output_base64_json_tellraw","storage":"large_number:math","interpret":true}
