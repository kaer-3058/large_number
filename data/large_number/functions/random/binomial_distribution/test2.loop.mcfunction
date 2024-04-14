#进行伯努利实验
execute store result score #sstemp1 int run random value 0..1000000000
execute if score #sstemp1 int < #binomial_distribution.test2.p int run scoreboard players add #binomial_distribution.test2.output int 1
scoreboard players remove #test2.times int 1
execute if score #test2.times int matches 1.. run function large_number:random/binomial_distribution/test2.loop
