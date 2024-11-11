##反余弦函数 - arccos(x)
#一万倍输入余弦值，输出角度
#输入范围：[-10000,10000]
#公式：arccos(x)=atan2(√(1-x^2), x)
#输入：scoreboard players set #arcsin_cos.input int 7502
#输出：data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

execute store result score #x int run scoreboard players operation #sstemp1 int = #arcsin_cos.input int
scoreboard players operation #sstemp1 int *= #sstemp1 int
scoreboard players operation #sstemp1 int *= -1 const
scoreboard players add #sstemp1 int 100000000

##简易开根
# INPUT: scoreboard players set #sstemp1 int 2

execute store result score #t1 int store result score #t2 int store result score #t3 int run scoreboard players operation #y int = #sstemp1 int
execute if score #sstemp1 int matches 0..1515359 run scoreboard players operation #y int /= 559 const
execute if score #sstemp1 int matches 0..1515359 run scoreboard players add #y int 15
execute if score #sstemp1 int matches 1515360.. run scoreboard players operation #y int /= 32768 const
execute if score #sstemp1 int matches 1515360.. run scoreboard players add #y int 2456
scoreboard players operation #t1 int /= #y int
scoreboard players operation #y int += #t1 int
scoreboard players operation #y int /= 2 const
scoreboard players operation #t2 int /= #y int
scoreboard players operation #y int += #t2 int
scoreboard players operation #y int /= 2 const
scoreboard players operation #t3 int /= #y int
scoreboard players operation #y int += #t3 int
scoreboard players operation #y int /= 2 const

# OUTPUT: scoreboard players get #y int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2_2

#感谢：小豆
