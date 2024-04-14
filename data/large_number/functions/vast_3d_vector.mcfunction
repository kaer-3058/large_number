##求大立方体对角线模长
#欧几里德范数
# 10^9 ≤ x^2 +y^2 +z^2 ≤ 10^16 -1

# x^2
execute store result score #1.3 int store result score #y int run data get storage math vast_3d_vector.input.x[1]
execute store result score #1.2 int store result score #x int run data get storage math vast_3d_vector.input.x[0]

execute store result score #4.4 int run scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #4.4 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #4.4 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #x int += #4.3 int
execute store result score #vast_3d_verctor.x^2_0 int run scoreboard players operation #4.2 int /= 10000 const
execute store result score #vast_3d_verctor.x^2_1 int run scoreboard players operation #x int %= 10000 const
execute store result score #vast_3d_verctor.x^2_2 int run scoreboard players operation #y int %= 10000 const
execute store result score #vast_3d_verctor.x^2_3 int run scoreboard players operation #1.3 int %= 10000 const

# y^2
execute store result score #1.3 int store result score #y int run data get storage math vast_3d_vector.input.y[1]
execute store result score #1.2 int store result score #x int run data get storage math vast_3d_vector.input.y[0]

execute store result score #4.4 int run scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #4.4 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #4.4 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #x int += #4.3 int
execute store result score #vast_3d_verctor.y^2_0 int run scoreboard players operation #4.2 int /= 10000 const
execute store result score #vast_3d_verctor.y^2_1 int run scoreboard players operation #x int %= 10000 const
execute store result score #vast_3d_verctor.y^2_2 int run scoreboard players operation #y int %= 10000 const
execute store result score #vast_3d_verctor.y^2_3 int run scoreboard players operation #1.3 int %= 10000 const

# z^2
execute store result score #1.3 int store result score #y int run data get storage math vast_3d_vector.input.z[1]
execute store result score #1.2 int store result score #x int run data get storage math vast_3d_vector.input.z[0]

execute store result score #4.4 int run scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #4.4 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #4.4 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #x int += #4.3 int
execute store result score #vast_3d_verctor.z^2_0 int run scoreboard players operation #4.2 int /= 10000 const
execute store result score #vast_3d_verctor.z^2_1 int run scoreboard players operation #x int %= 10000 const
execute store result score #vast_3d_verctor.z^2_2 int run scoreboard players operation #y int %= 10000 const
execute store result score #vast_3d_verctor.z^2_3 int run scoreboard players operation #1.3 int %= 10000 const

#加法
scoreboard players operation #vast_3d_verctor.x^2_0 int += #vast_3d_verctor.y^2_0 int
scoreboard players operation #vast_3d_verctor.x^2_0 int += #vast_3d_verctor.z^2_0 int
scoreboard players operation #vast_3d_verctor.x^2_1 int += #vast_3d_verctor.y^2_1 int
scoreboard players operation #vast_3d_verctor.x^2_1 int += #vast_3d_verctor.z^2_1 int
scoreboard players operation #vast_3d_verctor.x^2_2 int += #vast_3d_verctor.y^2_2 int
scoreboard players operation #vast_3d_verctor.x^2_2 int += #vast_3d_verctor.z^2_2 int
scoreboard players operation #vast_3d_verctor.x^2_3 int += #vast_3d_verctor.y^2_3 int
execute store result score #4.3 int run scoreboard players operation #vast_3d_verctor.x^2_3 int += #vast_3d_verctor.z^2_3 int

scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #vast_3d_verctor.x^2_2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #vast_3d_verctor.x^2_1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #vast_3d_verctor.x^2_0 int += #4.1 int
scoreboard players operation #vast_3d_verctor.x^2_1 int %= 10000 const
scoreboard players operation #vast_3d_verctor.x^2_2 int %= 10000 const
scoreboard players operation #vast_3d_verctor.x^2_3 int %= 10000 const


##开根号

execute store result score #digit1.1 int run scoreboard players get #vast_3d_verctor.x^2_0 int
execute store result score #digit1.2 int run scoreboard players get #vast_3d_verctor.x^2_1 int

execute if score #digit1.1 int matches 1.. run function large_number:large_sqrt_digit16.if/vast_3d_vector/input/all1_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. run function large_number:large_sqrt_digit16.if/vast_3d_vector/input/0_1000_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 run function large_number:large_sqrt_digit16.if/vast_3d_vector/input/0_10_

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #t4 int run scoreboard players operation #d2.1 int = #d1.1 int
scoreboard players operation #d2.1 int /= 32768 const
execute unless score #d1.1 int matches 0 run scoreboard players add #d2.1 int 2456
scoreboard players operation #t1 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t1 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t2 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t2 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t3 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t3 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t4 int /= #d2.1 int
execute if score #d2.1 int > #t4 int run scoreboard players remove #d2.1 int 1

execute store result score #6.1 int run scoreboard players operation #7.1 int = #d2.1 int

#估值公式
scoreboard players operation #6.1 int *= #6.1 int
scoreboard players operation #d1.1 int -= #6.1 int
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
execute store result score #d3.1 int run scoreboard players operation #d1.1 int /= #7.1 int

#调整最后一位
execute if score #digit1.1 int matches 1000.. if score #large_sqrt16.test16 int matches 1 run function large_number:large_sqrt_digit16.if/vast_3d_vector/test16/if

#输出
scoreboard players operation #d2.1 int *= 10000 const
scoreboard players operation #d2.1 int += #d3.1 int
execute if score #digit1.1 int matches 1000.. store result storage math vast_3d_vector.output int 1 run scoreboard players get #d2.1 int
execute if score #digit1.1 int matches 10..999 store result storage math vast_3d_vector.output int 1 run scoreboard players operation #d2.1 int /= 10 const
execute if score #digit1.1 int matches 1..9 store result storage math vast_3d_vector.output int 1 run scoreboard players operation #d2.1 int /= 100 const
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. store result storage math vast_3d_vector.output int 1 run scoreboard players operation #d2.1 int /= 100 const
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 store result storage math vast_3d_vector.output int 1 run scoreboard players operation #d2.1 int /= 1000 const