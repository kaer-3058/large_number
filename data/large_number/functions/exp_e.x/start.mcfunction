##指数函数  e^x

#输入：data modify storage math exp_e^x.input set value 2.722d
#输出：data get storage math exp_e^x.output
#输入值必须为double型
#输入范围为区间：(-709, 709)
#先取整数部分的e^x，再取前三位小数的e^x，三位小数以后的e^x用泰勒展开的前三项
#使用了九次函数宏共11条宏命令，三次展示实体除法，一次13位大数乘法，一次实体tp
#精确度：看浮点数的心情

#测试：正值，负值，很大的值，很小的值，0，整数值

data modify storage math store_exp_e_x_input set from storage math exp_e^x.input
scoreboard players set #is- int 1
data modify storage math stemp1 set string storage math exp_e^x.input 0 1
execute if data storage math {stemp1:"-"} run scoreboard players set #is- int -1
execute if data storage math {stemp1:"-"} run data modify storage math store_exp_e_x_input set string storage math store_exp_e_x_input 1 -1
execute if data storage math {stemp1:"-"} run function large_number:exp_e.x/macro4.input_for_absolute_value with storage math

#判断是否为科学计数法
data modify storage math temp1 set string storage math store_exp_e_x_input 0 -1
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

execute store result storage math temp1 int 1 run data get storage math store_exp_e_x_input 1

#如果输入的值很小则强行展开
execute if score #is_XXEXX int matches 1 if data storage math {temp1:0} in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:exp_e.x/input_add_1

#查表，整数部分和前三位小数
function large_number:exp_e.x/macro1.e.x.inte with storage math
execute store result score #stemp2 int store result storage math temp1 int 1 run data get storage math store_exp_e_x_input 1000
execute store result storage math temp1 int 1 run scoreboard players add #stemp2 int 1000
data modify storage math temp1 set string storage math temp1 -3
function large_number:exp_e.x/macro2.e.x.dicimal.1-3 with storage math

#取三位小数及以后的数
data modify storage math temp1 set value ""
data modify storage math temp_store_exp_e^x_input set string storage math store_exp_e_x_input 0 -1
execute store result score #temp1 int run data get storage math store_exp_e_x_input
execute if score #temp1 int matches 0..9 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 5
execute if score #temp1 int matches 10..99 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 6
execute if score #temp1 int matches 100..999 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 7
data modify storage math temp1 set string storage math temp1 0 13

#字符串数字取为记分板数字，靠前对齐
data modify storage math temp2 set value ""
execute store result score #1.1 int run scoreboard players set #1.3 int 0
execute store result score #temp1 int run data get storage math temp1
execute unless score #temp1 int matches 5.. run data modify storage math temp2 set from storage math temp1
execute unless score #temp1 int matches 5.. run data modify storage math temp1 set value 0
execute if score #temp1 int matches 5.. run data modify storage math temp2 set string storage math temp1 0 5
execute if score #temp1 int matches 5.. run data modify storage math temp1 set string storage math temp1 5
data modify storage math temp2 set string storage math temp2
data modify storage math temp1 set string storage math temp1
execute store result score #temp3 int run data get storage math temp2
execute store result score #temp4 int run data get storage math temp1
function large_number:exp_e.x/macro3.dicimal4--_div2 with storage math
execute if score #temp3 int matches 1 run scoreboard players operation #1.1 int *= 10000 const
execute if score #temp3 int matches 2 run scoreboard players operation #1.1 int *= 1000 const
execute if score #temp3 int matches 3 run scoreboard players operation #1.1 int *= 100 const
execute if score #temp3 int matches 4 run scoreboard players operation #1.1 int *= 10 const
execute if score #temp4 int matches 1 run scoreboard players operation #1.3 int *= 10000000 const
execute if score #temp4 int matches 2 run scoreboard players operation #1.3 int *= 1000000 const
execute if score #temp4 int matches 3 run scoreboard players operation #1.3 int *= 100000 const
execute if score #temp4 int matches 4 run scoreboard players operation #1.3 int *= 10000 const
execute if score #temp4 int matches 5 run scoreboard players operation #1.3 int *= 1000 const
execute if score #temp4 int matches 6 run scoreboard players operation #1.3 int *= 100 const
execute if score #temp4 int matches 7 run scoreboard players operation #1.3 int *= 10 const
scoreboard players operation #1.2 int = #1.1 int
scoreboard players operation #1.4 int = #1.3 int
execute store result score #10.1 int store result score #sstemp1 int run scoreboard players operation #1.1 int /= 10000 const
execute store result score #10.2 int run scoreboard players operation #1.2 int %= 10000 const
execute store result score #10.3 int run scoreboard players operation #1.3 int /= 10000 const
execute store result score #10.4 int run scoreboard players operation #1.4 int %= 10000 const

##泰勒公式，e^x在x=0处展开前三项：1+x+(x^2)/2 = x*(1+x/2)+1

#除法 /2
scoreboard players operation #1.1 int *= 10000 const
scoreboard players operation #1.1 int += #1.2 int
scoreboard players operation #1.1 int *= 10000 const
scoreboard players operation #1.1 int += #1.3 int
execute store result score #n int store result score #o int store result score #p int run scoreboard players operation #1.1 int /= 2 const
execute store result score #b int store result score #f int store result score #j int run scoreboard players operation #n int /= 100000000 const
scoreboard players operation #o int %= 100000000 const
execute store result score #c int store result score #g int store result score #k int run scoreboard players operation #o int /= 10000 const
execute store result score #d int store result score #h int store result score #l int run scoreboard players operation #p int %= 10000 const

execute store result score #a int store result score #e int store result score #i int store result score #m int run scoreboard players set #1.0 int 1

#13位数乘法 #10 * #1

#    abcd
#   efgh
#  ijkl
# mnop

execute store result score #4.1 int run scoreboard players operation #d int *= #10.4 int
scoreboard players operation #c int *= #10.4 int
scoreboard players operation #b int *= #10.4 int
scoreboard players operation #a int *= #10.4 int
scoreboard players operation #h int *= #10.3 int
scoreboard players operation #g int *= #10.3 int
scoreboard players operation #f int *= #10.3 int
scoreboard players operation #e int *= #10.3 int
scoreboard players operation #l int *= #10.2 int
scoreboard players operation #k int *= #10.2 int
scoreboard players operation #j int *= #10.2 int
scoreboard players operation #i int *= #10.2 int
scoreboard players operation #p int *= #10.1 int
scoreboard players operation #o int *= #10.1 int
scoreboard players operation #n int *= #10.1 int
scoreboard players operation #m int *= #10.1 int

scoreboard players operation #h int += #c int
scoreboard players operation #l int += #g int
scoreboard players operation #l int += #b int
scoreboard players operation #p int += #k int
scoreboard players operation #p int += #f int
scoreboard players operation #p int += #a int
scoreboard players operation #o int += #j int
scoreboard players operation #o int += #e int
scoreboard players operation #n int += #i int

scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #h int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #l int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #p int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #o int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #n int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #taylor.remainder.2 int run scoreboard players operation #m int += #4.1 int

#scoreboard players operation #d int %= 10000 const
#scoreboard players operation #h int %= 10000 const
#scoreboard players operation #l int %= 10000 const
execute store result score #taylor.remainder.5 int run scoreboard players operation #p int %= 10000 const
execute store result score #taylor.remainder.4 int run scoreboard players operation #o int %= 10000 const
execute store result score #taylor.remainder.3 int run scoreboard players operation #n int %= 10000 const
#scoreboard players set #taylor.remainder.1 int 1

##浮点相乘，整数*前三位小数*泰勒尾数

data modify storage math temp1 set string storage math temp_e^x_inte 0 -1

#判断是否为科学计数法
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage math temp_expon set value 0
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage math store_expon_1 set from storage math temp_expon

execute store result storage math temp5 int 1 run scoreboard players add #taylor.remainder.2 int 10000
execute store result storage math temp2 int 1 run scoreboard players add #taylor.remainder.3 int 10000
execute store result storage math temp3 int 1 run scoreboard players add #taylor.remainder.4 int 10000
execute store result storage math temp4 int 1 run scoreboard players add #taylor.remainder.5 int 10000

data modify storage math temp5 set string storage math temp5 1
data modify storage math temp2 set string storage math temp2 1
data modify storage math temp3 set string storage math temp3 1
data modify storage math temp4 set string storage math temp4 1

function large_number:exp_e.x/macro5.score_for_float with storage math

#展示实体浮点除法，a/(1/b) = a*b
execute in minecraft:overworld run data modify entity 28529-0-3d00-0-2c4200ee8401 transformation set from storage math temp10
execute in minecraft:overworld run data modify storage math temp10[0] set from entity 28529-0-3d00-0-2c4200ee8401 transformation.scale[0]
data modify storage math temp10[-1] set from storage math temp_e^x_dicimal_1-3
execute in minecraft:overworld run data modify entity 28529-0-3d00-0-2c4200ee8401 transformation set from storage math temp10
execute in minecraft:overworld run data modify storage math temp1 set from entity 28529-0-3d00-0-2c4200ee8401 transformation.scale[0]

data modify storage math temp1 set string storage math temp1 0 -1

#判断是否为科学计数法
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage math temp_expon set value 0
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage math store_expon_2 set from storage math temp_expon

#处理指数
function large_number:exp_e.x/macro6 with storage math
scoreboard players operation #store_expon_1 int *= -1 const
execute store result storage math temp9 int 1 run scoreboard players operation #store_expon_1 int += #store_expon_2 int

#如果输入的是负指数则取倒数
execute if score #is- int matches -1 run function large_number:exp_e.x/input.is-

function large_number:exp_e.x/macro7 with storage math

#特殊值
execute store result score #stemp1 int run data get storage math exp_e^x.input
execute if score #stemp1 int matches 709.. run data modify storage math exp_e^x.output set value 9.99999E400d
execute if score #stemp1 int matches ..-709 run data modify storage math exp_e^x.output set value 0.0d
execute if data storage math exp_e^x{input:1.0d} run data modify storage math exp_e^x.output set value 2.71828182845904523536028747135266249775724709369995d
