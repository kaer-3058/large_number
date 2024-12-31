#真·指南针
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:1700000000},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A7c指南针"}'}}

#指北针
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:-1700000000},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A71指北针"}'}}

#指向世界中心
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:0},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A7e世界中心指针"}'}}

#超级雷暴：execute at @a at @e summon end_crystal at @s run summon lightning_bolt


#在1.21版本，战利品表、物品修饰器和谓词都支持在命令里直接定义不依靠数据包，例：

#掉落一个石头
#loot spawn ~ ~ ~ loot {"type":"generic","pools":[{"rolls":1,"bonus_rolls":0,"entries":[{"type":"item","name":"stone"}]}]}

#修改主手物品名称
#item modify entity @s weapon.mainhand {"function":"set_name","name":{"text":"233","color":"green"}}

#50%概率测试通过
#execute at @a if predicate {"condition":"random_chance","chance":0.5}


#give @s evoker_spawn_egg[entity_data={id:"illusioner"},custom_model_data=513001]
#give @s evoker_spawn_egg[entity_data={id:"fox",Type:"snow"},custom_model_data=513002]
#give @s evoker_spawn_egg[entity_data={id:"rabbit",RabbitType:99},custom_model_data=513003]
#give @s evoker_spawn_egg[entity_data={id:"mooshroom",Type:"brown"},custom_model_data=513004]
#give @s evoker_spawn_egg[entity_data={id:"giant"},custom_model_data=513005]


#输入：scoreboard players set #damage_% int 3


#data modify storage large_number:math expression_evaluation.input set value "0.5^0·(cos(3^0·π·ｘ/2))+0.5^1·(cos(3^1·π·ｘ/2))+0.5^2·(cos(3^2·π·ｘ/2))+0.5^3·(cos(3^3·π·ｘ/2))+0.5^4·(cos(3^4·π·ｘ/2))+0.5^5·(cos(3^5·π·ｘ/2))+0.5^6·(cos(3^6·π·ｘ/2))+0.5^7·(cos(3^7·π·ｘ/2))+0.5^8·(cos(3^8·π·ｘ/2))+0.5^9·(cos(3^9·π·ｘ/2))+0.5^10·(cos(3^10·π·ｘ/2))"


