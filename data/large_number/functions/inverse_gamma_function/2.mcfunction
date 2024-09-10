##逆伽玛函数 - (𝜆,1.13)区间的近似

#data modify storage large_number:math inverse_gamma_function.input set value 21.0

#逆Γ(x+1)在(𝜆, 1.13)区间的近似公式：arcsin(1.23099326x-2.08932555)+π/2+𝜑

#𝜑≈0.4616321449684，𝜆≈0.8856031944109

function large_number:inverse_gamma_function/macro3 with storage large_number:math inverse_gamma_function

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 8
function large_number:gamma_function/stirling/macro1 with storage large_number:math

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:inverse_gamma_function/as_entity_3

#计算arcsin
scoreboard players operation #sstemp1 int *= #sstemp1 int
scoreboard players operation #sstemp1 int *= -1 const
scoreboard players add #sstemp1 int 100000000
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

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:inverse_gamma_function/as_entity_4
