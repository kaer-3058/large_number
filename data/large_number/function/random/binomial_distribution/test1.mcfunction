##二项分布 - 测试1
#测试内容：若输入值里包含2的幂，则有50%概率减去2的幂
#只接受正值，输出值范围为[0,input]

#输入：scoreboard players set #binomial_distribution.test1.input int 57745282

scoreboard players operation #binomial_distribution.test1.output int = #binomial_distribution.test1.input int
execute if score #binomial_distribution.test1.output int matches 1073741824.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 1073741824
execute if score #binomial_distribution.test1.output int matches 536870912.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 536870912
execute if score #binomial_distribution.test1.output int matches 268435456.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 268435456
execute if score #binomial_distribution.test1.output int matches 134217728.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 134217728
execute if score #binomial_distribution.test1.output int matches 67108864.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 67108864
execute if score #binomial_distribution.test1.output int matches 33554432.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 33554432
execute if score #binomial_distribution.test1.output int matches 16777216.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 16777216
execute if score #binomial_distribution.test1.output int matches 8388608.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 8388608
execute if score #binomial_distribution.test1.output int matches 4194304.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 4194304
execute if score #binomial_distribution.test1.output int matches 2097152.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 2097152
execute if score #binomial_distribution.test1.output int matches 1048576.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 1048576
execute if score #binomial_distribution.test1.output int matches 524288.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 524288
execute if score #binomial_distribution.test1.output int matches 262144.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 262144
execute if score #binomial_distribution.test1.output int matches 131072.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 131072
execute if score #binomial_distribution.test1.output int matches 65536.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 65536
execute if score #binomial_distribution.test1.output int matches 32768.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 32768
execute if score #binomial_distribution.test1.output int matches 16384.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 16384
execute if score #binomial_distribution.test1.output int matches 8192.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 8192
execute if score #binomial_distribution.test1.output int matches 4096.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 4096
execute if score #binomial_distribution.test1.output int matches 2048.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 2048
execute if score #binomial_distribution.test1.output int matches 1024.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 1024
execute if score #binomial_distribution.test1.output int matches 512.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 512
execute if score #binomial_distribution.test1.output int matches 256.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 256
execute if score #binomial_distribution.test1.output int matches 128.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 128
execute if score #binomial_distribution.test1.output int matches 64.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 64
execute if score #binomial_distribution.test1.output int matches 32.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 32
execute if score #binomial_distribution.test1.output int matches 16.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 16
execute if score #binomial_distribution.test1.output int matches 8.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 8
execute if score #binomial_distribution.test1.output int matches 4.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 4
execute if score #binomial_distribution.test1.output int matches 2.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 2
execute if score #binomial_distribution.test1.output int matches 1.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run scoreboard players remove #binomial_distribution.test1.output int 1
