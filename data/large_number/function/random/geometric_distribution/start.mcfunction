##几何分布

#单次事件的概率：data modify storage large_number:math geometric_distribution_chance set value 0.1
#试验次数：scoreboard players set #geometric_distribution.times large_number.int 50

scoreboard players set #geometric_distribution.output large_number.int 0
execute if score #geometric_distribution.output large_number.int < #geometric_distribution.times large_number.int run function large_number:random/geometric_distribution/loop1
