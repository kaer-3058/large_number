##UUID数组转化为带连字符的16进制 - 实体法

#输入：data modify entity 563adc0-fffd-c986-fd14-59f186a8aaa Thrower set value [I;0,0,0,1]
#UUID/玩家名：data get storage large_number:math uuid_list_for_hyphen_out.insertion
#实体类型：data get storage large_number:math uuid_list_for_hyphen_out.type

#利用物品实体进行转换，需要uuid数组对应的实体处于加载状态且必须存活

#execute as 563adc0-fffd-c986-fd14-59f186a8aaa on origin run function large_number:uuid_list_for_hyphen/as_item/start

tag @s add large_number_uuid_list_for_hyphen
data modify block -29999982 -64 22022222 front_text.messages[0] set value '{"selector": "@e[tag=large_number_uuid_list_for_hyphen,limit=1]"}'
tag @s remove large_number_uuid_list_for_hyphen

data modify storage large_number:math temp1 set from block -29999982 -64 22022222 front_text.messages[0]
function large_number:uuid_list_for_hyphen/as_item/macro1 with storage large_number:math

data modify storage large_number:math uuid_list_for_hyphen_out.insertion set from storage large_number:math temp1.insertion
data modify storage large_number:math uuid_list_for_hyphen_out.type set from storage large_number:math temp1.hoverEvent.contents.type
