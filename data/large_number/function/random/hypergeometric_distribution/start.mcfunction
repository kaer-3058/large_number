##概率模拟 - 超几何分布

#样本池：data modify storage large_number:math hypergeometric_distribution_list set value [7,3,5,11,5,9,6,13,2]
#必须输入int型正整数列表。输入列表里的元素按照它所在的位置，自从分配ID。比如第1个元素的ID为1，第五个元素ID为5。列表里每一项的数字表示这个ID的元素有几个。
#要抽取的元素ID：scoreboard players set #hypergeometric_distribution.target int 4
#抽取次数：scoreboard players set #hypergeometric_distribution.times int 30

scoreboard players set #sstemp.point int 1

data modify storage large_number:math temp1 set from storage large_number:math hypergeometric_distribution_list
data modify storage large_number:math temp2 set value []
execute if data storage large_number:math temp1[0] run function large_number:random/hypergeometric_distribution/loop1


##列表算法 - 洗牌
#输入：data modify storage large_number:math list_ope_shuffle.input set value []
#清理marker：kill @e[type=minecraft:marker,tag=large_number.list_operation]
#测试数量：execute if entity @e[type=minecraft:marker,tag=large_number.list_operation]

data modify storage large_number:math temp1 set from storage large_number:math temp2
data modify storage large_number:math temp2 set value []

execute store result score #list_length int if data storage large_number:math temp1[]
execute store result score #marker_number int if entity @e[type=minecraft:marker]
scoreboard players operation #temp1 int = #list_length int
scoreboard players operation #temp1 int -= #marker_number int

execute if score #temp1 int matches 1.. run function large_number:list_operation/shuffle/loop

execute as @e[type=minecraft:marker] run function large_number:list_operation/shuffle/default_sort.marker
execute as @e[type=minecraft:marker,sort=random] if data entity @s data.list_ope_shuffle run data modify storage large_number:math temp2 append from entity @s data.list_ope_shuffle

data modify storage large_number:math sstemp2 set from storage large_number:math temp2


##列表算法 - 抽牌

data modify storage large_number:math sstemp4 set value []
scoreboard players operation #store_hypergeometric_distribution.times int = #hypergeometric_distribution.times int
execute if score #store_hypergeometric_distribution.times int matches 1.. run function large_number:random/hypergeometric_distribution/loop3


#计算次数

execute store result storage large_number:math sstemp1 int 1 run scoreboard players get #hypergeometric_distribution.target int
execute store result score #temp1 int run data modify storage large_number:math sstemp4[].a set from storage large_number:math sstemp1
scoreboard players operation #hypergeometric_distribution.output int = #hypergeometric_distribution.times int
scoreboard players operation #hypergeometric_distribution.output int -= #temp1 int
