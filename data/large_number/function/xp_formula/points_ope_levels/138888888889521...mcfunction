##根据输入的经验总数求经验等级和经验余数
#反向经验公式：[√(72x-45503) +325] / 18 (x≥1758)
#经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式
#理论上输入值不应大于 2.07526*10^19

#乘法 *72
scoreboard players operation #xp_2.input[0] large_number.int *= 72 const
scoreboard players operation #xp_2.input[1] large_number.int *= 72 const
scoreboard players operation #xp_2.input[2] large_number.int *= 72 const
scoreboard players operation #xp_2.input[3] large_number.int *= 72 const
execute store result score #5.4 large_number.int run scoreboard players operation #xp_2.input[4] large_number.int *= 72 const

scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[3] large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[2] large_number.int += #5.3 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[1] large_number.int += #5.3 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #xp_2.input[-1] large_number.int run scoreboard players operation #xp_2.input[0] large_number.int += #5.3 large_number.int
scoreboard players operation #xp_2.input[-1] large_number.int /= 10000 const

scoreboard players operation #xp_2.input[0] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[1] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[2] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[3] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[4] large_number.int %= 10000 const


#减法 -54215
execute if score #xp_2.input[4] large_number.int matches ..4214 run scoreboard players remove #xp_2.input[3] large_number.int 1
execute if score #xp_2.input[4] large_number.int matches ..4214 run scoreboard players add #xp_2.input[4] large_number.int 10000
scoreboard players remove #xp_2.input[4] large_number.int 4125

execute if score #xp_2.input[3] large_number.int matches ..4 run scoreboard players remove #xp_2.input[2] large_number.int 1
execute if score #xp_2.input[3] large_number.int matches ..4 run scoreboard players add #xp_2.input[3] large_number.int 10000
scoreboard players remove #xp_2.input[3] large_number.int 5

execute if score #xp_2.input[2] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[1] large_number.int 1
execute if score #xp_2.input[2] large_number.int matches ..-1 run scoreboard players add #xp_2.input[2] large_number.int 10000

execute if score #xp_2.input[1] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[0] large_number.int 1
execute if score #xp_2.input[1] large_number.int matches ..-1 run scoreboard players add #xp_2.input[1] large_number.int 10000

execute if score #xp_2.input[0] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[-1] large_number.int 1
execute if score #xp_2.input[0] large_number.int matches ..-1 run scoreboard players add #xp_2.input[0] large_number.int 10000


##开根号
#秭级数以内的开平方-保留整数

# 1秭=10^24  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭
#此为竖式开方法

#原理：https://zhuanlan.zhihu.com/p/517358606

#输入
#data modify storage large_number:math large_sqrt.input set value [I;0,0,0,0,0,0]

execute store result score #11.1 large_number.int store result score #a large_number.int run scoreboard players operation #b large_number.int = #xp_2.input[-1] large_number.int
execute store result score #c large_number.int store result score #d large_number.int run scoreboard players operation #1.2 large_number.int = #xp_2.input[0] large_number.int
execute store result score #e large_number.int run scoreboard players operation #f large_number.int = #xp_2.input[1] large_number.int
execute store result score #g large_number.int run scoreboard players operation #h large_number.int = #xp_2.input[2] large_number.int
execute store result score #i large_number.int run scoreboard players operation #j large_number.int = #xp_2.input[3] large_number.int
execute store result score #k large_number.int run scoreboard players operation #l large_number.int = #xp_2.input[4] large_number.int

#拆位，两两分开
execute store result score #10.1 large_number.int store result score #2.0 large_number.int run scoreboard players operation #a large_number.int /= 100 const
scoreboard players operation #b large_number.int %= 100 const
scoreboard players operation #c large_number.int /= 100 const
scoreboard players operation #d large_number.int %= 100 const
scoreboard players operation #e large_number.int /= 100 const
scoreboard players operation #f large_number.int %= 100 const
scoreboard players operation #g large_number.int /= 100 const
scoreboard players operation #h large_number.int %= 100 const
scoreboard players operation #i large_number.int /= 100 const
scoreboard players operation #j large_number.int %= 100 const
scoreboard players operation #k large_number.int /= 100 const
scoreboard players operation #l large_number.int %= 100 const

# 商：#sqrt_root_X large_number.int  落下来的余数：#2.4 large_number.int  待迭代测试开方的值(*20的数)：#3.3 large_number.int

scoreboard players operation #11.1 large_number.int *= 10000 const
execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #11.2 large_number.int run scoreboard players operation #11.1 large_number.int += #1.2 large_number.int
execute if score #11.1 large_number.int matches 0..1515359 run scoreboard players operation #11.2 large_number.int /= 559 const
execute if score #11.1 large_number.int matches 0..1515359 run scoreboard players add #11.2 large_number.int 15
execute if score #11.1 large_number.int matches 1515360.. run scoreboard players operation #11.2 large_number.int /= 32768 const
execute if score #11.1 large_number.int matches 1515360.. run scoreboard players add #11.2 large_number.int 2456
scoreboard players operation #t1 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t1 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t2 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t3 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #11.1 large_number.int /= #11.2 large_number.int
execute if score #11.2 large_number.int > #11.1 large_number.int run scoreboard players remove #11.2 large_number.int 1

execute store result score #A.2 large_number.int store result score #B.2 large_number.int store result score #C.2 large_number.int run scoreboard players operation #D.2 large_number.int = #11.2 large_number.int

#对商进行拆位
scoreboard players operation #D.2 large_number.int %= 10 const
execute store result score #8.3 large_number.int run scoreboard players operation #C.2 large_number.int /= 10 const
scoreboard players operation #C.2 large_number.int %= 10 const
execute store result score #8.2 large_number.int run scoreboard players operation #B.2 large_number.int /= 100 const
scoreboard players operation #B.2 large_number.int %= 10 const
execute store result score #9.2 large_number.int store result score #9.1 large_number.int run scoreboard players operation #A.2 large_number.int /= 1000 const

#快速推出迭代数和落下来的余数
scoreboard players operation #9.1 large_number.int *= #9.1 large_number.int
scoreboard players operation #10.1 large_number.int -= #9.1 large_number.int
scoreboard players operation #10.1 large_number.int *= 100 const
scoreboard players operation #10.1 large_number.int += #b large_number.int
scoreboard players operation #9.2 large_number.int *= 20 const
scoreboard players operation #9.2 large_number.int += #B.2 large_number.int
scoreboard players operation #9.2 large_number.int *= #B.2 large_number.int
scoreboard players operation #10.1 large_number.int -= #9.2 large_number.int
scoreboard players operation #10.1 large_number.int *= 100 const
scoreboard players operation #10.1 large_number.int += #c large_number.int
scoreboard players operation #9.2 large_number.int = #8.2 large_number.int
scoreboard players operation #9.2 large_number.int *= 20 const
scoreboard players operation #9.2 large_number.int += #C.2 large_number.int
scoreboard players operation #9.2 large_number.int *= #C.2 large_number.int
scoreboard players operation #10.1 large_number.int -= #9.2 large_number.int
scoreboard players operation #10.1 large_number.int *= 100 const
scoreboard players operation #10.1 large_number.int += #d large_number.int
scoreboard players operation #9.2 large_number.int = #8.3 large_number.int
scoreboard players operation #9.2 large_number.int *= 20 const
scoreboard players operation #9.2 large_number.int += #D.2 large_number.int
scoreboard players operation #9.2 large_number.int *= #D.2 large_number.int
scoreboard players operation #10.1 large_number.int -= #9.2 large_number.int
scoreboard players operation #10.1 large_number.int *= 100 const
execute store result score #2.5 large_number.int store result score #2.6 large_number.int run scoreboard players operation #10.1 large_number.int += #e large_number.int
execute store result score #xp_2.large_sqrt[0] large_number.int store result score #5.1 large_number.int store result score #3.9.1 large_number.int store result score #3.8 large_number.int store result score #3.7 large_number.int store result score #3.6 large_number.int store result score #sqrt_root_X large_number.int run scoreboard players operation #9.2 large_number.int = #11.2 large_number.int
execute store result score #Iteration_2 large_number.int store result score #3.5 large_number.int run scoreboard players operation #9.2 large_number.int *= 20 const

##循环

#剩余被开方数：#f #g #h …… int  商：#sqrt_root_X large_number.int  落下来的余数：#2.5 large_number.int  待迭代测试开方的值(*20的数)：#3.5 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.5 large_number.int run function large_number:large_sqrt_if_tree/e1

##循环

scoreboard players operation #sqrt_root_Y large_number.int = #loop_math.1 large_number.int
scoreboard players operation #2.6 large_number.int -= #Iteration_2 large_number.int
scoreboard players operation #2.6 large_number.int *= 100 const
execute store result score #2.7 large_number.int run scoreboard players operation #2.6 large_number.int += #f large_number.int
scoreboard players operation #3.6 large_number.int *= 10 const
scoreboard players operation #3.6 large_number.int += #sqrt_root_Y large_number.int
execute store result score #Iteration_2 large_number.int run scoreboard players operation #3.6 large_number.int *= 20 const

#剩余被开方数：#g #h #i …… int  商：#sqrt_root_Y large_number.int  落下来的余数：#2.6 large_number.int  待迭代测试开方的值(*20的数)：#3.6 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.6 large_number.int run function large_number:large_sqrt_if_tree/f1

##循环

scoreboard players operation #sqrt_root_Y large_number.int *= 10 const
scoreboard players operation #sqrt_root_Y large_number.int += #loop_math.1 large_number.int
scoreboard players operation #2.7 large_number.int -= #Iteration_2 large_number.int
scoreboard players operation #2.7 large_number.int *= 100 const
execute store result score #2.8 large_number.int run scoreboard players operation #2.7 large_number.int += #g large_number.int
scoreboard players operation #3.7 large_number.int *= 100 const
scoreboard players operation #3.7 large_number.int += #sqrt_root_Y large_number.int
execute store result score #Iteration_2 large_number.int run scoreboard players operation #3.7 large_number.int *= 20 const

#剩余被开方数：#h #i #j …… int  商：#sqrt_root_Y large_number.int  落下来的余数：#2.7 large_number.int  待迭代测试开方的值(*20的数)：#3.7 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.7 large_number.int run function large_number:large_sqrt_if_tree/g1

##循环

scoreboard players operation #sqrt_root_Y large_number.int *= 10 const
scoreboard players operation #sqrt_root_Y large_number.int += #loop_math.1 large_number.int
scoreboard players operation #2.8 large_number.int -= #Iteration_2 large_number.int
scoreboard players operation #2.8 large_number.int *= 100 const
execute store result score #2.9.0 large_number.int store result score #2.9.1 large_number.int store result score #2.9.2 large_number.int run scoreboard players operation #2.8 large_number.int += #h large_number.int
scoreboard players operation #3.8 large_number.int *= 1000 const
scoreboard players operation #3.8 large_number.int += #sqrt_root_Y large_number.int
execute store result score #Iteration_2 large_number.int run scoreboard players operation #3.8 large_number.int *= 20 const

#剩余被开方数：#i #j #k #l …… int  商：#sqrt_root_Y large_number.int  落下来的余数：#2.8 large_number.int  待迭代测试开方的值(*20的数)：#3.8 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.8 large_number.int run function large_number:large_sqrt_if_tree/h1

##大循环-I

scoreboard players operation #sqrt_root_Y large_number.int *= 10 const
execute store result score #xp_2.large_sqrt[1] large_number.int store result score #5.2 large_number.int store result score #3.9.2 large_number.int run scoreboard players operation #sqrt_root_Y large_number.int += #loop_math.1 large_number.int

scoreboard players operation #2.9.2 large_number.int %= 10000 const
scoreboard players operation #2.9.1 large_number.int %= 100000000 const
scoreboard players operation #2.9.1 large_number.int /= 10000 const
scoreboard players operation #2.9.0 large_number.int /= 100000000 const

execute store result score #Iteration_3.1 large_number.int store result score #Iteration_3.2 large_number.int run scoreboard players operation #Iteration_3.0 large_number.int = #Iteration_2 large_number.int
scoreboard players operation #Iteration_3.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_3.1 large_number.int %= 100000000 const
scoreboard players operation #Iteration_3.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_3.0 large_number.int /= 100000000 const

#减法
execute if score #2.9.2 large_number.int < #Iteration_3.2 large_number.int run scoreboard players remove #2.9.1 large_number.int 1
execute if score #2.9.2 large_number.int < #Iteration_3.2 large_number.int run scoreboard players add #2.9.2 large_number.int 10000
scoreboard players operation #2.9.2 large_number.int -= #Iteration_3.2 large_number.int

execute if score #2.9.1 large_number.int < #Iteration_3.1 large_number.int run scoreboard players remove #2.9.0 large_number.int 1
execute if score #2.9.1 large_number.int < #Iteration_3.1 large_number.int run scoreboard players add #2.9.1 large_number.int 10000
scoreboard players operation #2.9.1 large_number.int -= #Iteration_3.1 large_number.int

scoreboard players operation #2.9.0 large_number.int -= #Iteration_3.0 large_number.int


execute store result score #4.2 large_number.int run scoreboard players operation #2.9.2 large_number.int *= 100 const
scoreboard players operation #2.9.1 large_number.int *= 100 const
scoreboard players operation #2.9.0 large_number.int *= 100 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.9.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #2.9.0 large_number.int += #4.1 large_number.int
scoreboard players operation #2.9.2 large_number.int %= 10000 const
scoreboard players operation #2.9.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #2.9.2 large_number.int += #i large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.9.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #2.10.1 large_number.int run scoreboard players operation #2.9.0 large_number.int += #4.1 large_number.int
execute store result score #2.10.3 large_number.int run scoreboard players operation #2.9.2 large_number.int %= 10000 const
execute store result score #2.10.2 large_number.int run scoreboard players operation #2.9.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #3.9.2 large_number.int *= 20 const
scoreboard players operation #3.9.1 large_number.int *= 20 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #3.9.1 large_number.int += #4.2 large_number.int
execute store result score #Iteration_2.0 large_number.int store result score #3.9.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #Iteration_2.2 large_number.int run scoreboard players operation #3.9.2 large_number.int %= 10000 const
execute store result score #Iteration_2.1 large_number.int run scoreboard players operation #3.9.1 large_number.int %= 10000 const

#剩余被开方数：#j #k #l …… int  商：#sqrt_root_Y large_number.int  落下来的余数：#2.9 large_number.int  待迭代测试开方的值(*20的数)：#3.9 large_number.int

scoreboard players set #loop_math.1 large_number.int 9

execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.0 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.9.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.9.0 large_number.int if score #Iteration_2.1 large_number.int > #2.9.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.9.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.9.1 large_number.int if score #Iteration_2.2 large_number.int > #2.9.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:large_sqrt_if_tree/i1

##大循环-J

scoreboard players operation #sqrt_root_Z large_number.int = #loop_math.1 large_number.int

#减法
execute if score #2.10.3 large_number.int < #Iteration_2.2 large_number.int run scoreboard players remove #2.10.2 large_number.int 1
execute if score #2.10.3 large_number.int < #Iteration_2.2 large_number.int run scoreboard players add #2.10.3 large_number.int 10000
scoreboard players operation #2.10.3 large_number.int -= #Iteration_2.2 large_number.int

execute if score #2.10.2 large_number.int < #Iteration_2.1 large_number.int run scoreboard players remove #2.10.1 large_number.int 1
execute if score #2.10.2 large_number.int < #Iteration_2.1 large_number.int run scoreboard players add #2.10.2 large_number.int 10000
scoreboard players operation #2.10.2 large_number.int -= #Iteration_2.1 large_number.int

scoreboard players operation #2.10.1 large_number.int -= #Iteration_2.0 large_number.int


execute store result score #4.2 large_number.int run scoreboard players operation #2.10.3 large_number.int *= 100 const
scoreboard players operation #2.10.2 large_number.int *= 100 const
scoreboard players operation #2.10.1 large_number.int *= 100 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.10.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.0 large_number.int run scoreboard players operation #2.10.1 large_number.int += #4.1 large_number.int
execute store result score #2.10.0 large_number.int run scoreboard players operation #4.0 large_number.int /= 10000 const
scoreboard players operation #2.10.3 large_number.int %= 10000 const
scoreboard players operation #2.10.2 large_number.int %= 10000 const
scoreboard players operation #2.10.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #2.10.3 large_number.int += #j large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.10.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.0 large_number.int run scoreboard players operation #2.10.1 large_number.int += #4.1 large_number.int
scoreboard players operation #4.0 large_number.int /= 10000 const
execute store result score #2.11.0 large_number.int run scoreboard players operation #2.10.0 large_number.int += #4.0 large_number.int
execute store result score #2.11.3 large_number.int run scoreboard players operation #2.10.3 large_number.int %= 10000 const
execute store result score #2.11.2 large_number.int run scoreboard players operation #2.10.2 large_number.int %= 10000 const
execute store result score #2.11.1 large_number.int run scoreboard players operation #2.10.1 large_number.int %= 10000 const

scoreboard players operation #5.2 large_number.int *= 10 const
execute store result score #4.2 large_number.int run scoreboard players operation #5.2 large_number.int += #sqrt_root_Z large_number.int

#数位对齐
scoreboard players operation #5.1 large_number.int *= 10 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #5.1 large_number.int += #4.2 large_number.int
execute store result score #3.10.1 large_number.int store result score #5.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #3.10.3 large_number.int run scoreboard players operation #5.2 large_number.int %= 10000 const
execute store result score #3.10.2 large_number.int run scoreboard players operation #5.1 large_number.int %= 10000 const


execute store result score #4.3 large_number.int run scoreboard players operation #3.10.3 large_number.int *= 20 const
scoreboard players operation #3.10.2 large_number.int *= 20 const
scoreboard players operation #3.10.1 large_number.int *= 20 const
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #3.10.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #3.10.1 large_number.int += #4.2 large_number.int
execute store result score #Iteration_2.0 large_number.int store result score #3.10.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #Iteration_2.3 large_number.int run scoreboard players operation #3.10.3 large_number.int %= 10000 const
execute store result score #Iteration_2.2 large_number.int run scoreboard players operation #3.10.2 large_number.int %= 10000 const
execute store result score #Iteration_2.1 large_number.int run scoreboard players operation #3.10.1 large_number.int %= 10000 const

#剩余被开方数：#k #l large_number.int  商：#sqrt_root_Z large_number.int  落下来的余数：#2.10 large_number.int  待迭代测试开方的值(*20的数)：#3.10 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.0 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.10.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.10.0 large_number.int if score #Iteration_2.1 large_number.int > #2.10.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.10.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.10.1 large_number.int if score #Iteration_2.2 large_number.int > #2.10.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.10.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.10.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.10.2 large_number.int if score #Iteration_2.3 large_number.int > #2.10.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:large_sqrt_if_tree/j1

##大循环-K

scoreboard players operation #sqrt_root_Z large_number.int *= 10 const
scoreboard players operation #sqrt_root_Z large_number.int += #loop_math.1 large_number.int

#减法
execute if score #2.11.3 large_number.int < #Iteration_2.3 large_number.int run scoreboard players remove #2.11.2 large_number.int 1
execute if score #2.11.3 large_number.int < #Iteration_2.3 large_number.int run scoreboard players add #2.11.3 large_number.int 10000
scoreboard players operation #2.11.3 large_number.int -= #Iteration_2.3 large_number.int

execute if score #2.11.2 large_number.int < #Iteration_2.2 large_number.int run scoreboard players remove #2.11.1 large_number.int 1
execute if score #2.11.2 large_number.int < #Iteration_2.2 large_number.int run scoreboard players add #2.11.2 large_number.int 10000
scoreboard players operation #2.11.2 large_number.int -= #Iteration_2.2 large_number.int

execute if score #2.11.1 large_number.int < #Iteration_2.1 large_number.int run scoreboard players remove #2.11.0 large_number.int 1
execute if score #2.11.1 large_number.int < #Iteration_2.1 large_number.int run scoreboard players add #2.11.1 large_number.int 10000
scoreboard players operation #2.11.1 large_number.int -= #Iteration_2.1 large_number.int

scoreboard players operation #2.11.0 large_number.int -= #Iteration_2.0 large_number.int


execute store result score #4.2 large_number.int run scoreboard players operation #2.11.3 large_number.int *= 100 const
scoreboard players operation #2.11.2 large_number.int *= 100 const
scoreboard players operation #2.11.1 large_number.int *= 100 const
scoreboard players operation #2.11.0 large_number.int *= 100 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.11.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.0 large_number.int run scoreboard players operation #2.11.1 large_number.int += #4.1 large_number.int
scoreboard players operation #4.0 large_number.int /= 10000 const
scoreboard players operation #2.11.0 large_number.int += #4.0 large_number.int
scoreboard players operation #2.11.3 large_number.int %= 10000 const
scoreboard players operation #2.11.2 large_number.int %= 10000 const
scoreboard players operation #2.11.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #2.11.3 large_number.int += #k large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.11.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.0 large_number.int run scoreboard players operation #2.11.1 large_number.int += #4.1 large_number.int
scoreboard players operation #4.0 large_number.int /= 10000 const
execute store result score #2.12.0 large_number.int run scoreboard players operation #2.11.0 large_number.int += #4.0 large_number.int
execute store result score #2.12.3 large_number.int run scoreboard players operation #2.11.3 large_number.int %= 10000 const
execute store result score #2.12.2 large_number.int run scoreboard players operation #2.11.2 large_number.int %= 10000 const
execute store result score #2.12.1 large_number.int run scoreboard players operation #2.11.1 large_number.int %= 10000 const

scoreboard players operation #5.1 large_number.int = #sqrt_root_X large_number.int
scoreboard players operation #5.2 large_number.int = #sqrt_root_Y large_number.int
scoreboard players operation #5.2 large_number.int *= 100 const
execute store result score #4.2 large_number.int run scoreboard players operation #5.2 large_number.int += #sqrt_root_Z large_number.int

#数位对齐
scoreboard players operation #5.1 large_number.int *= 100 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #5.1 large_number.int += #4.2 large_number.int
execute store result score #3.11.1 large_number.int store result score #5.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #3.11.3 large_number.int run scoreboard players operation #5.2 large_number.int %= 10000 const
execute store result score #3.11.2 large_number.int run scoreboard players operation #5.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #3.11.3 large_number.int *= 20 const
scoreboard players operation #3.11.2 large_number.int *= 20 const
scoreboard players operation #3.11.1 large_number.int *= 20 const
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #3.11.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #3.11.1 large_number.int += #4.2 large_number.int
execute store result score #Iteration_2.0 large_number.int store result score #3.11.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #Iteration_2.3 large_number.int run scoreboard players operation #3.11.3 large_number.int %= 10000 const
execute store result score #Iteration_2.2 large_number.int run scoreboard players operation #3.11.2 large_number.int %= 10000 const
execute store result score #Iteration_2.1 large_number.int run scoreboard players operation #3.11.1 large_number.int %= 10000 const

#剩余被开方数：#l large_number.int  商：#sqrt_root_Z large_number.int  落下来的余数：#2.11 large_number.int  待迭代测试开方的值(*20的数)：#3.11 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.0 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.11.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.11.0 large_number.int if score #Iteration_2.1 large_number.int > #2.11.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.11.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.11.1 large_number.int if score #Iteration_2.2 large_number.int > #2.11.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.11.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.11.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.11.2 large_number.int if score #Iteration_2.3 large_number.int > #2.11.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:large_sqrt_if_tree/k1

##大循环-L

scoreboard players operation #sqrt_root_Z large_number.int *= 10 const
scoreboard players operation #sqrt_root_Z large_number.int += #loop_math.1 large_number.int

#减法
execute if score #2.12.3 large_number.int < #Iteration_2.3 large_number.int run scoreboard players remove #2.12.2 large_number.int 1
execute if score #2.12.3 large_number.int < #Iteration_2.3 large_number.int run scoreboard players add #2.12.3 large_number.int 10000
scoreboard players operation #2.12.3 large_number.int -= #Iteration_2.3 large_number.int

execute if score #2.12.2 large_number.int < #Iteration_2.2 large_number.int run scoreboard players remove #2.12.1 large_number.int 1
execute if score #2.12.2 large_number.int < #Iteration_2.2 large_number.int run scoreboard players add #2.12.2 large_number.int 10000
scoreboard players operation #2.12.2 large_number.int -= #Iteration_2.2 large_number.int

execute if score #2.12.1 large_number.int < #Iteration_2.1 large_number.int run scoreboard players remove #2.12.0 large_number.int 1
execute if score #2.12.1 large_number.int < #Iteration_2.1 large_number.int run scoreboard players add #2.12.1 large_number.int 10000
scoreboard players operation #2.12.1 large_number.int -= #Iteration_2.1 large_number.int

scoreboard players operation #2.12.0 large_number.int -= #Iteration_2.0 large_number.int


execute store result score #4.2 large_number.int run scoreboard players operation #2.12.3 large_number.int *= 100 const
scoreboard players operation #2.12.2 large_number.int *= 100 const
scoreboard players operation #2.12.1 large_number.int *= 100 const
scoreboard players operation #2.12.0 large_number.int *= 100 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.12.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.0 large_number.int run scoreboard players operation #2.12.1 large_number.int += #4.1 large_number.int
scoreboard players operation #4.0 large_number.int /= 10000 const
scoreboard players operation #2.12.0 large_number.int += #4.0 large_number.int
scoreboard players operation #2.12.3 large_number.int %= 10000 const
scoreboard players operation #2.12.2 large_number.int %= 10000 const
scoreboard players operation #2.12.1 large_number.int %= 10000 const

execute store result score #4.2 large_number.int run scoreboard players operation #2.12.3 large_number.int += #l large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #2.12.2 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store success score #4.0 large_number.int run scoreboard players operation #2.12.1 large_number.int += #4.1 large_number.int
scoreboard players operation #4.0 large_number.int /= 10000 const
scoreboard players operation #2.12.0 large_number.int += #4.0 large_number.int
scoreboard players operation #2.12.3 large_number.int %= 10000 const
scoreboard players operation #2.12.2 large_number.int %= 10000 const
scoreboard players operation #2.12.1 large_number.int %= 10000 const

scoreboard players operation #5.1 large_number.int = #sqrt_root_X large_number.int
scoreboard players operation #5.2 large_number.int = #sqrt_root_Y large_number.int
scoreboard players operation #5.2 large_number.int *= 1000 const
execute store result score #4.2 large_number.int run scoreboard players operation #5.2 large_number.int += #sqrt_root_Z large_number.int

#数位对齐
scoreboard players operation #5.1 large_number.int *= 1000 const
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #5.1 large_number.int += #4.2 large_number.int
execute store result score #3.12.1 large_number.int store result score #5.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #3.12.3 large_number.int run scoreboard players operation #5.2 large_number.int %= 10000 const
execute store result score #3.12.2 large_number.int run scoreboard players operation #5.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #3.12.3 large_number.int *= 20 const
scoreboard players operation #3.12.2 large_number.int *= 20 const
scoreboard players operation #3.12.1 large_number.int *= 20 const
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #3.12.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #3.12.1 large_number.int += #4.2 large_number.int
execute store result score #Iteration_2.0 large_number.int store result score #3.12.0 large_number.int run scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #Iteration_2.3 large_number.int run scoreboard players operation #3.12.3 large_number.int %= 10000 const
execute store result score #Iteration_2.2 large_number.int run scoreboard players operation #3.12.2 large_number.int %= 10000 const
execute store result score #Iteration_2.1 large_number.int run scoreboard players operation #3.12.1 large_number.int %= 10000 const

#剩余被开方数：#l large_number.int  商：#sqrt_root_Z large_number.int  落下来的余数：#2.11 large_number.int  待迭代测试开方的值(*20的数)：#3.11 large_number.int

scoreboard players set #loop_math.1 large_number.int 9
execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.0 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.12.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int if score #Iteration_2.1 large_number.int > #2.12.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int if score #Iteration_2.2 large_number.int > #2.12.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.12.2 large_number.int if score #Iteration_2.3 large_number.int > #2.12.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:large_sqrt_if_tree/l1

#整数最后一位

scoreboard players operation #sqrt_root_Z large_number.int *= 10 const
execute store result score #xp_2.large_sqrt[2] large_number.int run scoreboard players operation #sqrt_root_Z large_number.int += #loop_math.1 large_number.int


#加法 +325
execute store result score #5.4 large_number.int run scoreboard players add #xp_2.large_sqrt[2] large_number.int 325
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #xp_2.large_sqrt[1] large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
scoreboard players operation #xp_2.large_sqrt[0] large_number.int += #5.4 large_number.int

scoreboard players operation #xp_2.large_sqrt[1] large_number.int %= 10000 const
scoreboard players operation #xp_2.large_sqrt[2] large_number.int %= 10000 const


#除法 /18
scoreboard players operation #temp1 large_number.int = #xp_2.large_sqrt[0] large_number.int
scoreboard players operation #temp1 large_number.int /= 18 const
scoreboard players operation #temp2 large_number.int = #xp_2.large_sqrt[0] large_number.int
scoreboard players operation #sstemp1 large_number.int = #temp1 large_number.int
scoreboard players operation #sstemp1 large_number.int *= 18 const
scoreboard players operation #temp2 large_number.int -= #sstemp1 large_number.int
scoreboard players operation #temp2 large_number.int *= 10000 const
scoreboard players operation #temp2 large_number.int += #xp_2.large_sqrt[1] large_number.int
scoreboard players operation #temp3 large_number.int = #temp2 large_number.int
scoreboard players operation #temp2 large_number.int /= 18 const
scoreboard players operation #sstemp2 large_number.int = #temp2 large_number.int
scoreboard players operation #sstemp2 large_number.int *= 18 const
scoreboard players operation #temp3 large_number.int -= #sstemp2 large_number.int
scoreboard players operation #temp3 large_number.int *= 10000 const
scoreboard players operation #temp3 large_number.int += #xp_2.large_sqrt[2] large_number.int
scoreboard players operation #temp3 large_number.int /= 18 const

scoreboard players operation #xp_2.out_level large_number.int = #temp1 large_number.int
scoreboard players operation #xp_2.out_level large_number.int *= 100000000 const
scoreboard players operation #temp2 large_number.int *= 10000 const
scoreboard players operation #xp_2.out_level large_number.int += #temp2 large_number.int
execute store result storage large_number:math xp_points_ope_levels.output_levels int 1 run scoreboard players operation #xp_2.out_level large_number.int += #temp3 large_number.int


##把得到的等级数代入经验公式算经验差

#经验公式：y=4.5x^2 -162.5x +2220
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=31开始求和

# #4=经验等级的平方
execute store result score #a large_number.int store result score #b large_number.int run scoreboard players operation #c large_number.int = #xp_2.out_level large_number.int
execute store result score #6.3 large_number.int store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players operation #c large_number.int %= 10000 const
scoreboard players operation #b large_number.int %= 100000000 const
execute store result score #6.2 large_number.int store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players operation #b large_number.int /= 10000 const
execute store result score #6.1 large_number.int store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players operation #a large_number.int /= 100000000 const

execute store result score #5.4 large_number.int store result score #4.5 large_number.int run scoreboard players operation #1.3 large_number.int *= #c large_number.int
execute store result score #4.4 large_number.int run scoreboard players operation #1.2 large_number.int *= #b large_number.int
execute store result score #4.3 large_number.int run scoreboard players operation #1.1 large_number.int *= #a large_number.int
scoreboard players operation #2.3 large_number.int *= #c large_number.int
scoreboard players operation #2.2 large_number.int *= #b large_number.int
execute store result score #4.2 large_number.int run scoreboard players operation #2.1 large_number.int *= #a large_number.int
scoreboard players operation #3.3 large_number.int *= #c large_number.int
scoreboard players operation #3.2 large_number.int *= #b large_number.int
execute store result score #4.1 large_number.int run scoreboard players operation #3.1 large_number.int *= #a large_number.int
scoreboard players operation #4.4 large_number.int += #2.3 large_number.int
scoreboard players operation #4.3 large_number.int += #2.2 large_number.int
scoreboard players operation #4.3 large_number.int += #3.3 large_number.int
scoreboard players operation #4.2 large_number.int += #3.2 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


#*4.5
execute store result score #5.4 large_number.int run scoreboard players operation #4.5 large_number.int *= 45 const
scoreboard players operation #4.4 large_number.int *= 45 const
scoreboard players operation #4.3 large_number.int *= 45 const
scoreboard players operation #4.2 large_number.int *= 45 const
scoreboard players operation #4.1 large_number.int *= 45 const
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


# *162.5
execute store result score #6.1 large_number.int store result score #6.2 large_number.int run scoreboard players operation #6.3 large_number.int = #xp_2.out_level large_number.int
scoreboard players operation #6.3 large_number.int %= 10000 const
scoreboard players operation #6.2 large_number.int %= 100000000 const
scoreboard players operation #6.2 large_number.int /= 10000 const
scoreboard players operation #6.1 large_number.int /= 100000000 const
execute store result score #6.-1 large_number.int run scoreboard players set #6.0 large_number.int 0

execute store result score #5.3 large_number.int run scoreboard players operation #6.3 large_number.int *= 1625 const
scoreboard players operation #6.2 large_number.int *= 1625 const
scoreboard players operation #6.1 large_number.int *= 1625 const
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #6.2 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #6.1 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
execute store result score #5.0 large_number.int run scoreboard players operation #6.0 large_number.int += #5.1 large_number.int
scoreboard players operation #5.0 large_number.int /= 10000 const
scoreboard players operation #6.-1 large_number.int += #5.0 large_number.int

scoreboard players operation #6.3 large_number.int %= 10000 const
scoreboard players operation #6.2 large_number.int %= 10000 const
scoreboard players operation #6.1 large_number.int %= 10000 const
scoreboard players operation #6.0 large_number.int %= 10000 const


#减法, #4-#6
execute if score #4.5 large_number.int < #6.3 large_number.int run scoreboard players remove #4.4 large_number.int 1
execute if score #4.5 large_number.int < #6.3 large_number.int run scoreboard players add #4.5 large_number.int 10000
scoreboard players operation #4.5 large_number.int -= #6.3 large_number.int

execute if score #4.4 large_number.int < #6.2 large_number.int run scoreboard players remove #4.3 large_number.int 1
execute if score #4.4 large_number.int < #6.2 large_number.int run scoreboard players add #4.4 large_number.int 10000
scoreboard players operation #4.4 large_number.int -= #6.2 large_number.int

execute if score #4.3 large_number.int < #6.1 large_number.int run scoreboard players remove #4.2 large_number.int 1
execute if score #4.3 large_number.int < #6.1 large_number.int run scoreboard players add #4.3 large_number.int 10000
scoreboard players operation #4.3 large_number.int -= #6.1 large_number.int

execute if score #4.2 large_number.int < #6.0 large_number.int run scoreboard players remove #4.1 large_number.int 1
execute if score #4.2 large_number.int < #6.0 large_number.int run scoreboard players add #4.2 large_number.int 10000
scoreboard players operation #4.2 large_number.int -= #6.0 large_number.int

scoreboard players operation #4.1 large_number.int -= #6.-1 large_number.int


# /10
scoreboard players operation #4.5 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.4 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.5 large_number.int += #5.4 large_number.int
scoreboard players operation #4.4 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.3 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #4.3 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.2 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.3 large_number.int += #5.4 large_number.int
scoreboard players operation #4.2 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.1 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.2 large_number.int += #5.4 large_number.int
scoreboard players operation #4.1 large_number.int /= 10 const


#+2220
execute store result score #5.4 large_number.int run scoreboard players add #4.5 large_number.int 2220
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


#减法，输入值减去算出来的值
execute store result score #xp_2.input[0] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-5]
execute store result score #xp_2.input[1] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-4]
execute store result score #xp_2.input[2] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-3]
execute store result score #xp_2.input[3] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-2]
execute store result score #xp_2.input[4] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-1]


#减法
execute if score #xp_2.input[4] large_number.int < #4.5 large_number.int run scoreboard players remove #xp_2.input[3] large_number.int 1
execute if score #xp_2.input[4] large_number.int < #4.5 large_number.int run scoreboard players add #xp_2.input[4] large_number.int 10000
scoreboard players operation #xp_2.input[4] large_number.int -= #4.5 large_number.int

execute if score #xp_2.input[3] large_number.int < #4.4 large_number.int run scoreboard players remove #xp_2.input[2] large_number.int 1
execute if score #xp_2.input[3] large_number.int < #4.4 large_number.int run scoreboard players add #xp_2.input[3] large_number.int 10000
scoreboard players operation #xp_2.input[3] large_number.int -= #4.4 large_number.int

execute if score #xp_2.input[2] large_number.int < #4.3 large_number.int run scoreboard players remove #xp_2.input[1] large_number.int 1
execute if score #xp_2.input[2] large_number.int < #4.3 large_number.int run scoreboard players add #xp_2.input[2] large_number.int 10000
scoreboard players operation #xp_2.input[2] large_number.int -= #4.3 large_number.int

execute if score #xp_2.input[1] large_number.int < #4.2 large_number.int run scoreboard players remove #xp_2.input[0] large_number.int 1
execute if score #xp_2.input[1] large_number.int < #4.2 large_number.int run scoreboard players add #xp_2.input[1] large_number.int 10000
scoreboard players operation #xp_2.input[1] large_number.int -= #4.2 large_number.int

scoreboard players operation #xp_2.input[0] large_number.int -= #4.1 large_number.int

data modify storage large_number:math xp_points_ope_levels.remaining_points set value [I;0,0,0,0,0]
execute store result storage large_number:math xp_points_ope_levels.remaining_points[0] int 1 run scoreboard players get #xp_2.input[0] large_number.int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[1] int 1 run scoreboard players get #xp_2.input[1] large_number.int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[2] int 1 run scoreboard players get #xp_2.input[2] large_number.int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[3] int 1 run scoreboard players get #xp_2.input[3] large_number.int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players get #xp_2.input[4] large_number.int
