##伽马分布的随机数

#伽马分布就是α个指数分布的总和

#λ(尺度参数，放大一千倍)：#random.λ int
#α(形状参数)：#random.α int

scoreboard players set #sstempu int 0
scoreboard players operation #loop int = #random.α int
execute if score #loop int matches 1.. run function large_number:random/gamma_distribution/loop

execute store result storage large_number:math random_as_gamma_distribution double .0001 run scoreboard players get #sstempu int
