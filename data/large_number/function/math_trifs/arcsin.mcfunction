##反正弦函数 - arcsin(x)
#一万倍输入正弦值，输出角度
#输入范围：[-10000,10000]
#公式：arcsin(x)=atan2(x, √(1-x^2))
#输入：scoreboard players set #arcsin_cos.input large_number.int 6103
#输出：data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

execute store result score #y large_number.int run scoreboard players operation #sstemp1 large_number.int = #arcsin_cos.input large_number.int
scoreboard players operation #sstemp1 large_number.int *= #sstemp1 large_number.int
scoreboard players operation #sstemp1 large_number.int *= -1 const
scoreboard players add #sstemp1 large_number.int 100000000

##简易开根
# INPUT: scoreboard players set #sstemp1 large_number.int 2

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int run scoreboard players operation #x large_number.int = #sstemp1 large_number.int
execute if score #sstemp1 large_number.int matches 0..1515359 run scoreboard players operation #x large_number.int /= 559 const
execute if score #sstemp1 large_number.int matches 0..1515359 run scoreboard players add #x large_number.int 15
execute if score #sstemp1 large_number.int matches 1515360.. run scoreboard players operation #x large_number.int /= 32768 const
execute if score #sstemp1 large_number.int matches 1515360.. run scoreboard players add #x large_number.int 2456
scoreboard players operation #t1 large_number.int /= #x large_number.int
scoreboard players operation #x large_number.int += #t1 large_number.int
scoreboard players operation #x large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #x large_number.int
scoreboard players operation #x large_number.int += #t2 large_number.int
scoreboard players operation #x large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #x large_number.int
scoreboard players operation #x large_number.int += #t3 large_number.int
scoreboard players operation #x large_number.int /= 2 const

# OUTPUT: scoreboard players get #x large_number.int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2_2
