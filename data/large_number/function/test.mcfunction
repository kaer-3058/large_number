#真·指南针
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:1700000000},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A7c指南针"}'}}

#指北针
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:-1700000000},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A71指北针"}'}}

#指向世界中心
#give @s minecraft:compass{LodestonePos:{X:0,Y:0,Z:0},LodestoneTracked:0b,LodestoneDimension:"minecraft:overworld",display:{Name:'{"text":"\\u00A7e世界中心指针"}'}}

#超级雷暴：execute at @e summon end_crystal at @s run summon lightning_bolt


#在1.21版本，战利品表、物品修饰器和谓词都支持在命令里直接定义不依靠数据包，例：

#掉落一个石头
#loot spawn ~ ~ ~ loot {"type":"generic","pools":[{"rolls":1,"bonus_rolls":0,"entries":[{"type":"item","name":"stone"}]}]}

#修改主手物品名称
#item modify entity @s weapon.mainhand {"function":"set_name","name":{"text":"233","color":"green"}}

#50%概率测试通过
#execute if predicate {"condition":"random_chance","chance":0.5}





