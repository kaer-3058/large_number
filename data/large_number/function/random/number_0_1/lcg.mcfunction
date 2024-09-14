##生成一个[0,1]区间的随机数 lcg算法

#执行：execute as 3faf-0-3d00-0-61900f4241f run function large_number:random/number_0_1/lcg

item replace entity @s weapon.mainhand with minecraft:stone 1 
item modify entity @s weapon.mainhand large_number:number_0_1
data modify storage large_number:math random_number_0_1 set from entity @s HandItems[0].components."minecraft:attribute_modifiers".modifiers[0].amount
