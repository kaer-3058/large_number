##根据输入的经验总数求经验等级和经验余数
#反向经验公式：[√(72x-45503) +325] / 18 (x≥1758)
#经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式
#理论上输入值不应大于 2.07526*10^19

#乘法 *72
scoreboard players operation #xp_2.input[0] int *= 72 const
scoreboard players operation #xp_2.input[1] int *= 72 const
scoreboard players operation #xp_2.input[2] int *= 72 const
scoreboard players operation #xp_2.input[3] int *= 72 const
execute store result score #5.4 int run scoreboard players operation #xp_2.input[4] int *= 72 const

scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #xp_2.input[3] int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #xp_2.input[2] int += #5.3 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #xp_2.input[1] int += #5.3 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #xp_2.input[-1] int run scoreboard players operation #xp_2.input[0] int += #5.3 int
scoreboard players operation #xp_2.input[-1] int /= 10000 const

scoreboard players operation #xp_2.input[0] int %= 10000 const
scoreboard players operation #xp_2.input[1] int %= 10000 const
scoreboard players operation #xp_2.input[2] int %= 10000 const
scoreboard players operation #xp_2.input[3] int %= 10000 const
scoreboard players operation #xp_2.input[4] int %= 10000 const


#减法 -55503
execute if score #xp_2.input[4] int matches ..4214 run scoreboard players remove #xp_2.input[3] int 1
execute if score #xp_2.input[4] int matches ..4214 run scoreboard players add #xp_2.input[4] int 10000
scoreboard players remove #xp_2.input[4] int 5503

execute if score #xp_2.input[3] int matches ..4 run scoreboard players remove #xp_2.input[2] int 1
execute if score #xp_2.input[3] int matches ..4 run scoreboard players add #xp_2.input[3] int 10000
scoreboard players remove #xp_2.input[3] int 5

execute if score #xp_2.input[2] int matches ..-1 run scoreboard players remove #xp_2.input[1] int 1
execute if score #xp_2.input[2] int matches ..-1 run scoreboard players add #xp_2.input[2] int 10000

execute if score #xp_2.input[1] int matches ..-1 run scoreboard players remove #xp_2.input[0] int 1
execute if score #xp_2.input[1] int matches ..-1 run scoreboard players add #xp_2.input[1] int 10000

execute if score #xp_2.input[0] int matches ..-1 run scoreboard players remove #xp_2.input[-1] int 1
execute if score #xp_2.input[0] int matches ..-1 run scoreboard players add #xp_2.input[0] int 10000


##开根号
#秭级数以内的开平方-保留整数

# 1秭=10^24  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭
#此为竖式开方法

#原理：https://zhuanlan.zhihu.com/p/517358606

#输入
#data modify storage large_number:math large_sqrt.input set value [I;0,0,0,0,0,0]

execute store result score #11.1 int store result score #a int run scoreboard players operation #b int = #xp_2.input[-1] int
execute store result score #c int store result score #d int run scoreboard players operation #1.2 int = #xp_2.input[0] int
execute store result score #e int run scoreboard players operation #f int = #xp_2.input[1] int
execute store result score #g int run scoreboard players operation #h int = #xp_2.input[2] int
execute store result score #i int run scoreboard players operation #j int = #xp_2.input[3] int
execute store result score #k int run scoreboard players operation #l int = #xp_2.input[4] int

#拆位，两两分开
execute store result score #10.1 int store result score #2.0 int run scoreboard players operation #a int /= 100 const
scoreboard players operation #b int %= 100 const
scoreboard players operation #c int /= 100 const
scoreboard players operation #d int %= 100 const
scoreboard players operation #e int /= 100 const
scoreboard players operation #f int %= 100 const
scoreboard players operation #g int /= 100 const
scoreboard players operation #h int %= 100 const
scoreboard players operation #i int /= 100 const
scoreboard players operation #j int %= 100 const
scoreboard players operation #k int /= 100 const
scoreboard players operation #l int %= 100 const

# 商：#sqrt_root_X int  落下来的余数：#2.4 int  待迭代测试开方的值(*20的数)：#3.3 int

scoreboard players operation #11.1 int *= 10000 const
execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #11.2 int run scoreboard players operation #11.1 int += #1.2 int
execute if score #11.1 int matches 0..1515359 run scoreboard players operation #11.2 int /= 559 const
execute if score #11.1 int matches 0..1515359 run scoreboard players add #11.2 int 15
execute if score #11.1 int matches 1515360.. run scoreboard players operation #11.2 int /= 32768 const
execute if score #11.1 int matches 1515360.. run scoreboard players add #11.2 int 2456
scoreboard players operation #t1 int /= #11.2 int
scoreboard players operation #11.2 int += #t1 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #t2 int /= #11.2 int
scoreboard players operation #11.2 int += #t2 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #t3 int /= #11.2 int
scoreboard players operation #11.2 int += #t3 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #11.1 int /= #11.2 int
execute if score #11.2 int > #11.1 int run scoreboard players remove #11.2 int 1

execute store result score #A.2 int store result score #B.2 int store result score #C.2 int run scoreboard players operation #D.2 int = #11.2 int

#对商进行拆位
scoreboard players operation #D.2 int %= 10 const
execute store result score #8.3 int run scoreboard players operation #C.2 int /= 10 const
scoreboard players operation #C.2 int %= 10 const
execute store result score #8.2 int run scoreboard players operation #B.2 int /= 100 const
scoreboard players operation #B.2 int %= 10 const
execute store result score #9.2 int store result score #9.1 int run scoreboard players operation #A.2 int /= 1000 const

#快速推出迭代数和落下来的余数
scoreboard players operation #9.1 int *= #9.1 int
scoreboard players operation #10.1 int -= #9.1 int
scoreboard players operation #10.1 int *= 100 const
scoreboard players operation #10.1 int += #b int
scoreboard players operation #9.2 int *= 20 const
scoreboard players operation #9.2 int += #B.2 int
scoreboard players operation #9.2 int *= #B.2 int
scoreboard players operation #10.1 int -= #9.2 int
scoreboard players operation #10.1 int *= 100 const
scoreboard players operation #10.1 int += #c int
scoreboard players operation #9.2 int = #8.2 int
scoreboard players operation #9.2 int *= 20 const
scoreboard players operation #9.2 int += #C.2 int
scoreboard players operation #9.2 int *= #C.2 int
scoreboard players operation #10.1 int -= #9.2 int
scoreboard players operation #10.1 int *= 100 const
scoreboard players operation #10.1 int += #d int
scoreboard players operation #9.2 int = #8.3 int
scoreboard players operation #9.2 int *= 20 const
scoreboard players operation #9.2 int += #D.2 int
scoreboard players operation #9.2 int *= #D.2 int
scoreboard players operation #10.1 int -= #9.2 int
scoreboard players operation #10.1 int *= 100 const
execute store result score #2.5 int store result score #2.6 int run scoreboard players operation #10.1 int += #e int
execute store result score #xp_2.large_sqrt[0] int store result score #5.1 int store result score #3.9.1 int store result score #3.8 int store result score #3.7 int store result score #3.6 int store result score #sqrt_root_X int run scoreboard players operation #9.2 int = #11.2 int
execute store result score #Iteration_2 int store result score #3.5 int run scoreboard players operation #9.2 int *= 20 const

##循环

#剩余被开方数：#f #g #h …… int  商：#sqrt_root_X int  落下来的余数：#2.5 int  待迭代测试开方的值(*20的数)：#3.5 int

scoreboard players set #loop_math.1 int 9
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.5 int run function large_number:large_sqrt_if_tree/e1

##循环

scoreboard players operation #sqrt_root_Y int = #loop_math.1 int
scoreboard players operation #2.6 int -= #Iteration_2 int
scoreboard players operation #2.6 int *= 100 const
execute store result score #2.7 int run scoreboard players operation #2.6 int += #f int
scoreboard players operation #3.6 int *= 10 const
scoreboard players operation #3.6 int += #sqrt_root_Y int
execute store result score #Iteration_2 int run scoreboard players operation #3.6 int *= 20 const

#剩余被开方数：#g #h #i …… int  商：#sqrt_root_Y int  落下来的余数：#2.6 int  待迭代测试开方的值(*20的数)：#3.6 int

scoreboard players set #loop_math.1 int 9
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.6 int run function large_number:large_sqrt_if_tree/f1

##循环

scoreboard players operation #sqrt_root_Y int *= 10 const
scoreboard players operation #sqrt_root_Y int += #loop_math.1 int
scoreboard players operation #2.7 int -= #Iteration_2 int
scoreboard players operation #2.7 int *= 100 const
execute store result score #2.8 int run scoreboard players operation #2.7 int += #g int
scoreboard players operation #3.7 int *= 100 const
scoreboard players operation #3.7 int += #sqrt_root_Y int
execute store result score #Iteration_2 int run scoreboard players operation #3.7 int *= 20 const

#剩余被开方数：#h #i #j …… int  商：#sqrt_root_Y int  落下来的余数：#2.7 int  待迭代测试开方的值(*20的数)：#3.7 int

scoreboard players set #loop_math.1 int 9
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.7 int run function large_number:large_sqrt_if_tree/g1

##循环

scoreboard players operation #sqrt_root_Y int *= 10 const
scoreboard players operation #sqrt_root_Y int += #loop_math.1 int
scoreboard players operation #2.8 int -= #Iteration_2 int
scoreboard players operation #2.8 int *= 100 const
execute store result score #2.9.0 int store result score #2.9.1 int store result score #2.9.2 int run scoreboard players operation #2.8 int += #h int
scoreboard players operation #3.8 int *= 1000 const
scoreboard players operation #3.8 int += #sqrt_root_Y int
execute store result score #Iteration_2 int run scoreboard players operation #3.8 int *= 20 const

#剩余被开方数：#i #j #k #l …… int  商：#sqrt_root_Y int  落下来的余数：#2.8 int  待迭代测试开方的值(*20的数)：#3.8 int

scoreboard players set #loop_math.1 int 9
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.8 int run function large_number:large_sqrt_if_tree/h1

##大循环-I

scoreboard players operation #sqrt_root_Y int *= 10 const
execute store result score #xp_2.large_sqrt[1] int store result score #5.2 int store result score #3.9.2 int run scoreboard players operation #sqrt_root_Y int += #loop_math.1 int

scoreboard players operation #2.9.2 int %= 10000 const
scoreboard players operation #2.9.1 int %= 100000000 const
scoreboard players operation #2.9.1 int /= 10000 const
scoreboard players operation #2.9.0 int /= 100000000 const

execute store result score #Iteration_3.1 int store result score #Iteration_3.2 int run scoreboard players operation #Iteration_3.0 int = #Iteration_2 int
scoreboard players operation #Iteration_3.2 int %= 10000 const
scoreboard players operation #Iteration_3.1 int %= 100000000 const
scoreboard players operation #Iteration_3.1 int /= 10000 const
scoreboard players operation #Iteration_3.0 int /= 100000000 const

#减法
execute if score #2.9.2 int < #Iteration_3.2 int run scoreboard players remove #2.9.1 int 1
execute if score #2.9.2 int < #Iteration_3.2 int run scoreboard players add #2.9.2 int 10000
scoreboard players operation #2.9.2 int -= #Iteration_3.2 int

execute if score #2.9.1 int < #Iteration_3.1 int run scoreboard players remove #2.9.0 int 1
execute if score #2.9.1 int < #Iteration_3.1 int run scoreboard players add #2.9.1 int 10000
scoreboard players operation #2.9.1 int -= #Iteration_3.1 int

scoreboard players operation #2.9.0 int -= #Iteration_3.0 int


execute store result score #4.2 int run scoreboard players operation #2.9.2 int *= 100 const
scoreboard players operation #2.9.1 int *= 100 const
scoreboard players operation #2.9.0 int *= 100 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.9.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #2.9.0 int += #4.1 int
scoreboard players operation #2.9.2 int %= 10000 const
scoreboard players operation #2.9.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #2.9.2 int += #i int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.9.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #2.10.1 int run scoreboard players operation #2.9.0 int += #4.1 int
execute store result score #2.10.3 int run scoreboard players operation #2.9.2 int %= 10000 const
execute store result score #2.10.2 int run scoreboard players operation #2.9.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #3.9.2 int *= 20 const
scoreboard players operation #3.9.1 int *= 20 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #3.9.1 int += #4.2 int
execute store result score #Iteration_2.0 int store result score #3.9.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #Iteration_2.2 int run scoreboard players operation #3.9.2 int %= 10000 const
execute store result score #Iteration_2.1 int run scoreboard players operation #3.9.1 int %= 10000 const

#剩余被开方数：#j #k #l …… int  商：#sqrt_root_Y int  落下来的余数：#2.9 int  待迭代测试开方的值(*20的数)：#3.9 int

scoreboard players set #loop_math.1 int 9

execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #loop_math.1 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.1 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.0 int *= #loop_math.1 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.9.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.9.0 int if score #Iteration_2.1 int > #2.9.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.9.0 int unless score #Iteration_2.1 int < #2.9.1 int if score #Iteration_2.2 int > #2.9.2 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:large_sqrt_if_tree/i1

##大循环-J

scoreboard players operation #sqrt_root_Z int = #loop_math.1 int

#减法
execute if score #2.10.3 int < #Iteration_2.2 int run scoreboard players remove #2.10.2 int 1
execute if score #2.10.3 int < #Iteration_2.2 int run scoreboard players add #2.10.3 int 10000
scoreboard players operation #2.10.3 int -= #Iteration_2.2 int

execute if score #2.10.2 int < #Iteration_2.1 int run scoreboard players remove #2.10.1 int 1
execute if score #2.10.2 int < #Iteration_2.1 int run scoreboard players add #2.10.2 int 10000
scoreboard players operation #2.10.2 int -= #Iteration_2.1 int

scoreboard players operation #2.10.1 int -= #Iteration_2.0 int


execute store result score #4.2 int run scoreboard players operation #2.10.3 int *= 100 const
scoreboard players operation #2.10.2 int *= 100 const
scoreboard players operation #2.10.1 int *= 100 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.10.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #2.10.1 int += #4.1 int
execute store result score #2.10.0 int run scoreboard players operation #4.0 int /= 10000 const
scoreboard players operation #2.10.3 int %= 10000 const
scoreboard players operation #2.10.2 int %= 10000 const
scoreboard players operation #2.10.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #2.10.3 int += #j int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.10.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #2.10.1 int += #4.1 int
scoreboard players operation #4.0 int /= 10000 const
execute store result score #2.11.0 int run scoreboard players operation #2.10.0 int += #4.0 int
execute store result score #2.11.3 int run scoreboard players operation #2.10.3 int %= 10000 const
execute store result score #2.11.2 int run scoreboard players operation #2.10.2 int %= 10000 const
execute store result score #2.11.1 int run scoreboard players operation #2.10.1 int %= 10000 const

scoreboard players operation #5.2 int *= 10 const
execute store result score #4.2 int run scoreboard players operation #5.2 int += #sqrt_root_Z int

#数位对齐
scoreboard players operation #5.1 int *= 10 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #5.1 int += #4.2 int
execute store result score #3.10.1 int store result score #5.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #3.10.3 int run scoreboard players operation #5.2 int %= 10000 const
execute store result score #3.10.2 int run scoreboard players operation #5.1 int %= 10000 const


execute store result score #4.3 int run scoreboard players operation #3.10.3 int *= 20 const
scoreboard players operation #3.10.2 int *= 20 const
scoreboard players operation #3.10.1 int *= 20 const
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #3.10.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #3.10.1 int += #4.2 int
execute store result score #Iteration_2.0 int store result score #3.10.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #Iteration_2.3 int run scoreboard players operation #3.10.3 int %= 10000 const
execute store result score #Iteration_2.2 int run scoreboard players operation #3.10.2 int %= 10000 const
execute store result score #Iteration_2.1 int run scoreboard players operation #3.10.1 int %= 10000 const

#剩余被开方数：#k #l int  商：#sqrt_root_Z int  落下来的余数：#2.10 int  待迭代测试开方的值(*20的数)：#3.10 int

scoreboard players set #loop_math.1 int 9
execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int += #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.2 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.1 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.0 int *= #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.10.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int if score #Iteration_2.1 int > #2.10.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int if score #Iteration_2.2 int > #2.10.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int unless score #Iteration_2.2 int < #2.10.2 int if score #Iteration_2.3 int > #2.10.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:large_sqrt_if_tree/j1

##大循环-K

scoreboard players operation #sqrt_root_Z int *= 10 const
scoreboard players operation #sqrt_root_Z int += #loop_math.1 int

#减法
execute if score #2.11.3 int < #Iteration_2.3 int run scoreboard players remove #2.11.2 int 1
execute if score #2.11.3 int < #Iteration_2.3 int run scoreboard players add #2.11.3 int 10000
scoreboard players operation #2.11.3 int -= #Iteration_2.3 int

execute if score #2.11.2 int < #Iteration_2.2 int run scoreboard players remove #2.11.1 int 1
execute if score #2.11.2 int < #Iteration_2.2 int run scoreboard players add #2.11.2 int 10000
scoreboard players operation #2.11.2 int -= #Iteration_2.2 int

execute if score #2.11.1 int < #Iteration_2.1 int run scoreboard players remove #2.11.0 int 1
execute if score #2.11.1 int < #Iteration_2.1 int run scoreboard players add #2.11.1 int 10000
scoreboard players operation #2.11.1 int -= #Iteration_2.1 int

scoreboard players operation #2.11.0 int -= #Iteration_2.0 int


execute store result score #4.2 int run scoreboard players operation #2.11.3 int *= 100 const
scoreboard players operation #2.11.2 int *= 100 const
scoreboard players operation #2.11.1 int *= 100 const
scoreboard players operation #2.11.0 int *= 100 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.11.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #2.11.1 int += #4.1 int
scoreboard players operation #4.0 int /= 10000 const
scoreboard players operation #2.11.0 int += #4.0 int
scoreboard players operation #2.11.3 int %= 10000 const
scoreboard players operation #2.11.2 int %= 10000 const
scoreboard players operation #2.11.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #2.11.3 int += #k int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.11.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #2.11.1 int += #4.1 int
scoreboard players operation #4.0 int /= 10000 const
execute store result score #2.12.0 int run scoreboard players operation #2.11.0 int += #4.0 int
execute store result score #2.12.3 int run scoreboard players operation #2.11.3 int %= 10000 const
execute store result score #2.12.2 int run scoreboard players operation #2.11.2 int %= 10000 const
execute store result score #2.12.1 int run scoreboard players operation #2.11.1 int %= 10000 const

scoreboard players operation #5.1 int = #sqrt_root_X int
scoreboard players operation #5.2 int = #sqrt_root_Y int
scoreboard players operation #5.2 int *= 100 const
execute store result score #4.2 int run scoreboard players operation #5.2 int += #sqrt_root_Z int

#数位对齐
scoreboard players operation #5.1 int *= 100 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #5.1 int += #4.2 int
execute store result score #3.11.1 int store result score #5.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #3.11.3 int run scoreboard players operation #5.2 int %= 10000 const
execute store result score #3.11.2 int run scoreboard players operation #5.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #3.11.3 int *= 20 const
scoreboard players operation #3.11.2 int *= 20 const
scoreboard players operation #3.11.1 int *= 20 const
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #3.11.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #3.11.1 int += #4.2 int
execute store result score #Iteration_2.0 int store result score #3.11.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #Iteration_2.3 int run scoreboard players operation #3.11.3 int %= 10000 const
execute store result score #Iteration_2.2 int run scoreboard players operation #3.11.2 int %= 10000 const
execute store result score #Iteration_2.1 int run scoreboard players operation #3.11.1 int %= 10000 const

#剩余被开方数：#l int  商：#sqrt_root_Z int  落下来的余数：#2.11 int  待迭代测试开方的值(*20的数)：#3.11 int

scoreboard players set #loop_math.1 int 9
execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int += #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.2 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.1 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.0 int *= #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.11.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.11.0 int if score #Iteration_2.1 int > #2.11.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.11.0 int unless score #Iteration_2.1 int < #2.11.1 int if score #Iteration_2.2 int > #2.11.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.11.0 int unless score #Iteration_2.1 int < #2.11.1 int unless score #Iteration_2.2 int < #2.11.2 int if score #Iteration_2.3 int > #2.11.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:large_sqrt_if_tree/k1

##大循环-L

scoreboard players operation #sqrt_root_Z int *= 10 const
scoreboard players operation #sqrt_root_Z int += #loop_math.1 int

#减法
execute if score #2.12.3 int < #Iteration_2.3 int run scoreboard players remove #2.12.2 int 1
execute if score #2.12.3 int < #Iteration_2.3 int run scoreboard players add #2.12.3 int 10000
scoreboard players operation #2.12.3 int -= #Iteration_2.3 int

execute if score #2.12.2 int < #Iteration_2.2 int run scoreboard players remove #2.12.1 int 1
execute if score #2.12.2 int < #Iteration_2.2 int run scoreboard players add #2.12.2 int 10000
scoreboard players operation #2.12.2 int -= #Iteration_2.2 int

execute if score #2.12.1 int < #Iteration_2.1 int run scoreboard players remove #2.12.0 int 1
execute if score #2.12.1 int < #Iteration_2.1 int run scoreboard players add #2.12.1 int 10000
scoreboard players operation #2.12.1 int -= #Iteration_2.1 int

scoreboard players operation #2.12.0 int -= #Iteration_2.0 int


execute store result score #4.2 int run scoreboard players operation #2.12.3 int *= 100 const
scoreboard players operation #2.12.2 int *= 100 const
scoreboard players operation #2.12.1 int *= 100 const
scoreboard players operation #2.12.0 int *= 100 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.12.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.0 int run scoreboard players operation #2.12.1 int += #4.1 int
scoreboard players operation #4.0 int /= 10000 const
scoreboard players operation #2.12.0 int += #4.0 int
scoreboard players operation #2.12.3 int %= 10000 const
scoreboard players operation #2.12.2 int %= 10000 const
scoreboard players operation #2.12.1 int %= 10000 const

execute store result score #4.2 int run scoreboard players operation #2.12.3 int += #l int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #2.12.2 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
execute store success score #4.0 int run scoreboard players operation #2.12.1 int += #4.1 int
scoreboard players operation #4.0 int /= 10000 const
scoreboard players operation #2.12.0 int += #4.0 int
scoreboard players operation #2.12.3 int %= 10000 const
scoreboard players operation #2.12.2 int %= 10000 const
scoreboard players operation #2.12.1 int %= 10000 const

scoreboard players operation #5.1 int = #sqrt_root_X int
scoreboard players operation #5.2 int = #sqrt_root_Y int
scoreboard players operation #5.2 int *= 1000 const
execute store result score #4.2 int run scoreboard players operation #5.2 int += #sqrt_root_Z int

#数位对齐
scoreboard players operation #5.1 int *= 1000 const
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #5.1 int += #4.2 int
execute store result score #3.12.1 int store result score #5.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #3.12.3 int run scoreboard players operation #5.2 int %= 10000 const
execute store result score #3.12.2 int run scoreboard players operation #5.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #3.12.3 int *= 20 const
scoreboard players operation #3.12.2 int *= 20 const
scoreboard players operation #3.12.1 int *= 20 const
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #3.12.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #3.12.1 int += #4.2 int
execute store result score #Iteration_2.0 int store result score #3.12.0 int run scoreboard players operation #4.1 int /= 10000 const
execute store result score #Iteration_2.3 int run scoreboard players operation #3.12.3 int %= 10000 const
execute store result score #Iteration_2.2 int run scoreboard players operation #3.12.2 int %= 10000 const
execute store result score #Iteration_2.1 int run scoreboard players operation #3.12.1 int %= 10000 const

#剩余被开方数：#l int  商：#sqrt_root_Z int  落下来的余数：#2.11 int  待迭代测试开方的值(*20的数)：#3.11 int

scoreboard players set #loop_math.1 int 9
execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int += #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.2 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.1 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.0 int *= #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.12.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.12.0 int if score #Iteration_2.1 int > #2.12.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.12.0 int unless score #Iteration_2.1 int < #2.12.1 int if score #Iteration_2.2 int > #2.12.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.12.0 int unless score #Iteration_2.1 int < #2.12.1 int unless score #Iteration_2.2 int < #2.12.2 int if score #Iteration_2.3 int > #2.12.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:large_sqrt_if_tree/l1

#整数最后一位

scoreboard players operation #sqrt_root_Z int *= 10 const
execute store result score #xp_2.large_sqrt[2] int run scoreboard players operation #sqrt_root_Z int += #loop_math.1 int


#加法 +325
execute store result score #5.4 int run scoreboard players add #xp_2.large_sqrt[2] int 325
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #xp_2.large_sqrt[1] int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
scoreboard players operation #xp_2.large_sqrt[0] int += #5.4 int

scoreboard players operation #xp_2.large_sqrt[1] int %= 10000 const
scoreboard players operation #xp_2.large_sqrt[2] int %= 10000 const


#除法 /18
scoreboard players operation #temp1 int = #xp_2.large_sqrt[0] int
scoreboard players operation #temp1 int /= 18 const
scoreboard players operation #temp2 int = #xp_2.large_sqrt[0] int
scoreboard players operation #sstemp1 int = #temp1 int
scoreboard players operation #sstemp1 int *= 18 const
scoreboard players operation #temp2 int -= #sstemp1 int
scoreboard players operation #temp2 int *= 10000 const
scoreboard players operation #temp2 int += #xp_2.large_sqrt[1] int
scoreboard players operation #temp3 int = #temp2 int
scoreboard players operation #temp2 int /= 18 const
scoreboard players operation #sstemp2 int = #temp2 int
scoreboard players operation #sstemp2 int *= 18 const
scoreboard players operation #temp3 int -= #sstemp2 int
scoreboard players operation #temp3 int *= 10000 const
scoreboard players operation #temp3 int += #xp_2.large_sqrt[2] int
scoreboard players operation #temp3 int /= 18 const

scoreboard players operation #xp_2.out_level int = #temp1 int
scoreboard players operation #xp_2.out_level int *= 100000000 const
scoreboard players operation #temp2 int *= 10000 const
scoreboard players operation #xp_2.out_level int += #temp2 int
execute store result storage large_number:math xp_points_ope_levels.output_levels int 1 run scoreboard players operation #xp_2.out_level int += #temp3 int


##把得到的等级数代入经验公式算经验差

#经验公式：y=4.5x^2 -162.5x +2099
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=31开始求和

# #4=经验等级的平方
execute store result score #a int store result score #b int run scoreboard players operation #c int = #xp_2.out_level int
execute store result score #6.3 int store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
execute store result score #6.2 int store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players operation #b int /= 10000 const
execute store result score #6.1 int store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #c int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #b int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #a int
scoreboard players operation #2.3 int *= #c int
scoreboard players operation #2.2 int *= #b int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #a int
scoreboard players operation #3.3 int *= #c int
scoreboard players operation #3.2 int *= #b int
execute store result score #4.1 int run scoreboard players operation #3.1 int *= #a int
scoreboard players operation #4.4 int += #2.3 int
scoreboard players operation #4.3 int += #2.2 int
scoreboard players operation #4.3 int += #3.3 int
scoreboard players operation #4.2 int += #3.2 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const


#*4.5
execute store result score #5.4 int run scoreboard players operation #4.5 int *= 45 const
scoreboard players operation #4.4 int *= 45 const
scoreboard players operation #4.3 int *= 45 const
scoreboard players operation #4.2 int *= 45 const
scoreboard players operation #4.1 int *= 45 const
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const


# *162.5
execute store result score #6.1 int store result score #6.2 int run scoreboard players operation #6.3 int = #xp_2.out_level int
scoreboard players operation #6.3 int %= 10000 const
scoreboard players operation #6.2 int %= 100000000 const
scoreboard players operation #6.2 int /= 10000 const
scoreboard players operation #6.1 int /= 100000000 const
execute store result score #6.-1 int run scoreboard players set #6.0 int 0

execute store result score #5.3 int run scoreboard players operation #6.3 int *= 1625 const
scoreboard players operation #6.2 int *= 1625 const
scoreboard players operation #6.1 int *= 1625 const
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #6.2 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #6.1 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
execute store result score #5.0 int run scoreboard players operation #6.0 int += #5.1 int
scoreboard players operation #5.0 int /= 10000 const
scoreboard players operation #6.-1 int += #5.0 int

scoreboard players operation #6.3 int %= 10000 const
scoreboard players operation #6.2 int %= 10000 const
scoreboard players operation #6.1 int %= 10000 const
scoreboard players operation #6.0 int %= 10000 const


#减法, #4-#6
execute if score #4.5 int < #6.3 int run scoreboard players remove #4.4 int 1
execute if score #4.5 int < #6.3 int run scoreboard players add #4.5 int 10000
scoreboard players operation #4.5 int -= #6.3 int

execute if score #4.4 int < #6.2 int run scoreboard players remove #4.3 int 1
execute if score #4.4 int < #6.2 int run scoreboard players add #4.4 int 10000
scoreboard players operation #4.4 int -= #6.2 int

execute if score #4.3 int < #6.1 int run scoreboard players remove #4.2 int 1
execute if score #4.3 int < #6.1 int run scoreboard players add #4.3 int 10000
scoreboard players operation #4.3 int -= #6.1 int

execute if score #4.2 int < #6.0 int run scoreboard players remove #4.1 int 1
execute if score #4.2 int < #6.0 int run scoreboard players add #4.2 int 10000
scoreboard players operation #4.2 int -= #6.0 int

scoreboard players operation #4.1 int -= #6.-1 int


# /10
scoreboard players operation #4.5 int /= 10 const
scoreboard players operation #5.4 int = #4.4 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.5 int += #5.4 int
scoreboard players operation #4.4 int /= 10 const
scoreboard players operation #5.4 int = #4.3 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #4.3 int /= 10 const
scoreboard players operation #5.4 int = #4.2 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.3 int += #5.4 int
scoreboard players operation #4.2 int /= 10 const
scoreboard players operation #5.4 int = #4.1 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.2 int += #5.4 int
scoreboard players operation #4.1 int /= 10 const


#+2099
execute store result score #5.4 int run scoreboard players add #4.5 int 2099
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const


#减法，输入值减去算出来的值
execute store result score #xp_2.input[0] int run data get storage large_number:math xp_points_ope_levels.input[-5]
execute store result score #xp_2.input[1] int run data get storage large_number:math xp_points_ope_levels.input[-4]
execute store result score #xp_2.input[2] int run data get storage large_number:math xp_points_ope_levels.input[-3]
execute store result score #xp_2.input[3] int run data get storage large_number:math xp_points_ope_levels.input[-2]
execute store result score #xp_2.input[4] int run data get storage large_number:math xp_points_ope_levels.input[-1]


#减法
execute if score #xp_2.input[4] int < #4.5 int run scoreboard players remove #xp_2.input[3] int 1
execute if score #xp_2.input[4] int < #4.5 int run scoreboard players add #xp_2.input[4] int 10000
scoreboard players operation #xp_2.input[4] int -= #4.5 int

execute if score #xp_2.input[3] int < #4.4 int run scoreboard players remove #xp_2.input[2] int 1
execute if score #xp_2.input[3] int < #4.4 int run scoreboard players add #xp_2.input[3] int 10000
scoreboard players operation #xp_2.input[3] int -= #4.4 int

execute if score #xp_2.input[2] int < #4.3 int run scoreboard players remove #xp_2.input[1] int 1
execute if score #xp_2.input[2] int < #4.3 int run scoreboard players add #xp_2.input[2] int 10000
scoreboard players operation #xp_2.input[2] int -= #4.3 int

execute if score #xp_2.input[1] int < #4.2 int run scoreboard players remove #xp_2.input[0] int 1
execute if score #xp_2.input[1] int < #4.2 int run scoreboard players add #xp_2.input[1] int 10000
scoreboard players operation #xp_2.input[1] int -= #4.2 int

scoreboard players operation #xp_2.input[0] int -= #4.1 int

data modify storage large_number:math xp_points_ope_levels.remaining_points set value [I;0,0,0,0,0]
execute store result storage large_number:math xp_points_ope_levels.remaining_points[0] int 1 run scoreboard players get #xp_2.input[0] int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[1] int 1 run scoreboard players get #xp_2.input[1] int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[2] int 1 run scoreboard players get #xp_2.input[2] int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[3] int 1 run scoreboard players get #xp_2.input[3] int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players get #xp_2.input[4] int
