##二项分布 - 测试2
#测试内容：做n次成功概率为p的伯努利试验
#只接受正值，返回成功次数
#试验次数不宜过多

#试验次数：scoreboard players set #binomial_distribution.test2.n int 50
#单次试验成功概率(放大10^9倍)：scoreboard players set #binomial_distribution.test2.p int 700000000

scoreboard players set #binomial_distribution.test2.output int 0
scoreboard players operation #test2.times int = #binomial_distribution.test2.n int
execute if score #test2.times int matches 1.. run function large_number:random/binomial_distribution/test2.loop
