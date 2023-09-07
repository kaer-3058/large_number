##秭级数以内的开平方-保留整数
# 1秭=10^24  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭

#原理：https://zhuanlan.zhihu.com/p/517358606

#输入
#data modify storage math large_sqrt.input set value [I;9999,9999,9999,9999,9999,9999]

execute store result score #11.1 int store result score #a int store result score #b int run data get storage math large_sqrt.input[0]
execute store result score #c int store result score #d int store result score #1.2 int run data get storage math large_sqrt.input[1]
execute store result score #e int store result score #f int run data get storage math large_sqrt.input[2]
execute store result score #g int store result score #h int run data get storage math large_sqrt.input[3]
execute store result score #i int store result score #j int run data get storage math large_sqrt.input[4]
execute store result score #k int store result score #l int run data get storage math large_sqrt.input[5]

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
execute store result score #1.0 int store result score #1.1 int store result score #1.2 int store result score #1.3 int store result score #11.2 int run scoreboard players operation #11.1 int += #1.2 int
execute if score #11.1 int matches ..13924 run function large_number:simple_int_sqrt_range/large_sqrt/0
execute if score #11.1 int matches 13925..16777216 run function large_number:simple_int_sqrt_range/large_sqrt/1
execute if score #11.1 int matches 16777217.. run function large_number:simple_int_sqrt_range/large_sqrt/2
scoreboard players operation #1.0 int /= #11.2 int
scoreboard players operation #11.2 int += #1.0 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #1.1 int /= #11.2 int
scoreboard players operation #11.2 int += #1.1 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #1.2 int /= #11.2 int
scoreboard players operation #11.2 int += #1.2 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #1.3 int /= #11.2 int
scoreboard players operation #11.2 int += #1.3 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation #11.2 int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #11.1 int run scoreboard players remove #11.2 int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #11.1 int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add #11.2 int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #11.1 int run scoreboard players remove #11.2 int 1

execute store result score #A.2 int store result score #B.2 int store result score #C.2 int store result score #D.2 int run scoreboard players get #11.2 int

#添加验证结果：首先去int_sqrt_simple复制命令，结果在简易开根结果套一层存储验证1和验证2，并把其他的存储挪下来，然后验证结果检查的输出和输入一一对应。

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
data modify storage math large_sqrt.output set value [I;0,0,0]
execute store result storage math large_sqrt.output[0] int 1.0 store result score #5.1 int store result score #3.9.1 int store result score #3.8 int store result score #3.7 int store result score #3.6 int store result score #sqrt_root_X int run scoreboard players operation #9.2 int = #11.2 int
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
execute store result storage math large_sqrt.output[1] int 1.0 store result score #5.2 int store result score #3.9.2 int run scoreboard players operation #sqrt_root_Y int += #loop_math.1 int

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
execute store result storage math large_sqrt.output[2] int 1.0 run scoreboard players operation #sqrt_root_Z int += #loop_math.1 int
