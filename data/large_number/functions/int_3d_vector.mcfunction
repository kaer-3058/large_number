##求立方体对角线模长
#欧几里德范数
#x^2 +y^2 +z^2 ≤ 2147483647

#scoreboard players set x int 123
#scoreboard players set y int 123
#scoreboard players set z int 123

scoreboard players operation #d1.1 int = x int
scoreboard players operation #d1.2 int = y int
scoreboard players operation #d1.3 int = z int

scoreboard players operation #d1.1 int *= #d1.1 int
scoreboard players operation #d1.2 int *= #d1.2 int
scoreboard players operation #d1.3 int *= #d1.3 int
scoreboard players operation #d1.1 int += #d1.2 int
scoreboard players operation #d1.1 int += #d1.3 int

#开根号

scoreboard players operation #inp int = #d1.1 int
execute if score #d1.1 int matches 1..9 run scoreboard players operation #inp int *= 100000000 const
execute if score #d1.1 int matches 10..999 run scoreboard players operation #inp int *= 1000000 const
execute if score #d1.1 int matches 1000..99999 run scoreboard players operation #inp int *= 10000 const
execute if score #d1.1 int matches 100000..9999999 run scoreboard players operation #inp int *= 100 const

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #6.1 int run scoreboard players operation vec_.output int = #inp int
execute if score #inp int matches 0..1515359 run scoreboard players operation vec_.output int /= 559 const
execute if score #inp int matches 0..1515359 run scoreboard players add vec_.output int 15
execute if score #inp int matches 1515360.. run scoreboard players operation vec_.output int /= 32768 const
execute if score #inp int matches 1515360.. run scoreboard players add vec_.output int 2456
scoreboard players operation #t1 int /= vec_.output int
scoreboard players operation vec_.output int += #t1 int
scoreboard players operation vec_.output int /= 2 const
scoreboard players operation #t2 int /= vec_.output int
scoreboard players operation vec_.output int += #t2 int
scoreboard players operation vec_.output int /= 2 const
scoreboard players operation #t3 int /= vec_.output int
scoreboard players operation vec_.output int += #t3 int
scoreboard players operation vec_.output int /= 2 const
scoreboard players operation #inp int /= vec_.output int
execute if score vec_.output int > #inp int run scoreboard players remove vec_.output int 1

execute store result score #7.1 int run scoreboard players operation #6.2 int = vec_.output int

#估值公式
scoreboard players operation #6.2 int *= #6.2 int
scoreboard players operation #6.1 int -= #6.2 int
scoreboard players operation #6.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
scoreboard players operation #6.1 int /= #7.1 int

scoreboard players operation vec_.output int *= 10000 const
scoreboard players operation vec_.output int += #6.1 int

execute if score #d1.1 int matches 1..9 run scoreboard players operation vec_.output int /= 10000 const
execute if score #d1.1 int matches 10..999 run scoreboard players operation vec_.output int /= 1000 const
execute if score #d1.1 int matches 1000..99999 run scoreboard players operation vec_.output int /= 100 const
execute if score #d1.1 int matches 100000..9999999 run scoreboard players operation vec_.output int /= 10 const
