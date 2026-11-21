##秭级数以内的开平方-保留整数
# 1秭=10^24  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭
#此为竖式开方法

#原理：https://zhuanlan.zhihu.com/p/517358606

#输入
#最高支持24位数，但不一定非要输入满24位，兼容1~24位数
#data modify storage large_number:math large_sqrt.input set value [I;0,0,0,0,0,0]

execute store result score #11.1 large_number.int store result score #a large_number.int store result score #b large_number.int run data get storage large_number:math large_sqrt.input[-6]
execute store result score #c large_number.int store result score #d large_number.int store result score #1.2 large_number.int run data get storage large_number:math large_sqrt.input[-5]
execute store result score #e large_number.int store result score #f large_number.int run data get storage large_number:math large_sqrt.input[-4]
execute store result score #g large_number.int store result score #h large_number.int run data get storage large_number:math large_sqrt.input[-3]
execute store result score #i large_number.int store result score #j large_number.int run data get storage large_number:math large_sqrt.input[-2]
execute store result score #k large_number.int store result score #l large_number.int run data get storage large_number:math large_sqrt.input[-1]

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
data modify storage large_number:math large_sqrt.output set value [I;0,0,0]
execute store result storage large_number:math large_sqrt.output[0] int 1.0 store result score #5.1 large_number.int store result score #3.9.1 large_number.int store result score #3.8 large_number.int store result score #3.7 large_number.int store result score #3.6 large_number.int store result score #sqrt_root_X large_number.int run scoreboard players operation #9.2 large_number.int = #11.2 large_number.int
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
execute store result storage large_number:math large_sqrt.output[1] int 1.0 store result score #5.2 large_number.int store result score #3.9.2 large_number.int run scoreboard players operation #sqrt_root_Y large_number.int += #loop_math.1 large_number.int

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
execute store result storage large_number:math large_sqrt.output[2] int 1.0 run scoreboard players operation #sqrt_root_Z large_number.int += #loop_math.1 large_number.int
