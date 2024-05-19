##反正弦函数 - arcsin(x)
#一万倍输入正弦值，输出角度
#输入范围：[-10000,10000]
#公式：arcsin(x)=atan2(x, √(1-x^2))
#输入：scoreboard players set #arcsin_cos.input int 6103
#输出：data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

execute store result score #y int run scoreboard players operation #sstemp1 int = #arcsin_cos.input int
scoreboard players operation #sstemp1 int *= #sstemp1 int
scoreboard players operation #sstemp1 int *= -1 const
scoreboard players add #sstemp1 int 100000000

##简易开根
# INPUT: scoreboard players set #sstemp1 int 2

execute store result score #t1 int store result score #t2 int store result score #t3 int run scoreboard players operation #x int = #sstemp1 int
execute if score #sstemp1 int matches 0..1515359 run scoreboard players operation #x int /= 559 const
execute if score #sstemp1 int matches 0..1515359 run scoreboard players add #x int 15
execute if score #sstemp1 int matches 1515360.. run scoreboard players operation #x int /= 32768 const
execute if score #sstemp1 int matches 1515360.. run scoreboard players add #x int 2456
scoreboard players operation #t1 int /= #x int
scoreboard players operation #x int += #t1 int
scoreboard players operation #x int /= 2 const
scoreboard players operation #t2 int /= #x int
scoreboard players operation #x int += #t2 int
scoreboard players operation #x int /= 2 const
scoreboard players operation #t3 int /= #x int
scoreboard players operation #x int += #t3 int
scoreboard players operation #x int /= 2 const

# OUTPUT: scoreboard players get #x int

execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2
