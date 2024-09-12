##二项分布 - 测试2
#测试内容：做n次成功概率为p的伯努利试验
#只接受正值，返回成功次数

#试验次数[int]：data modify storage large_number:math binomial_distribution.n set value 200
#单次试验成功概率[float]：data modify storage large_number:math binomial_distribution.p set value 0.7f

item replace entity 3faf-0-3d00-0-61900f4241f weapon.mainhand with minecraft:stone 1 
item modify entity 3faf-0-3d00-0-61900f4241f weapon.mainhand large_number:binomial_distribution
data modify storage large_number:math binomial_distribution.output set from entity 3faf-0-3d00-0-61900f4241f HandItems[0].components."minecraft:custom_model_data"
