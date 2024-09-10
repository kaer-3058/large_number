##浮点乘法
#原理：把尾数和指数拆开，尾数相乘，指数相加，最后位移

#data modify storage large_number:math float_multiply.input1 set value 7.41
#data modify storage large_number:math float_multiply.input2 set value 17.233

#符号判断
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input1 0 1
execute store success score #is-.1 int if data storage large_number:math {temp1:"-"}
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input2 0 1
execute store success score #is-.2 int if data storage large_number:math {temp1:"-"}

data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input1 0 -1
execute if score #is-.1 int matches 1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage large_number:math stemp1 set from storage large_number:math temp1
data modify storage large_number:math stemp_expon set from storage large_number:math temp_expon

data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input2 0 -1
execute if score #is-.2 int matches 1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #temp_expon1 int run function large_number:float_multiply/macro1 with storage large_number:math
execute store result score #temp_expon3 int run function large_number:float_multiply/macro1.2 with storage large_number:math

execute store result score #temp1 int store result score #temp2 int run data get storage large_number:math t1
execute if score #temp2 int matches 0..9 store result score #temp1 int run data get storage large_number:math t1 100000000
execute if score #temp2 int matches 10..99 store result score #temp1 int run data get storage large_number:math t1 10000000
execute if score #temp2 int matches 100..999 store result score #temp1 int run data get storage large_number:math t1 1000000
execute if score #temp2 int matches 1000..9999 store result score #temp1 int run data get storage large_number:math t1 100000
execute if score #temp2 int matches 10000..99999 store result score #temp1 int run data get storage large_number:math t1 10000
execute if score #temp2 int matches 100000..999999 store result score #temp1 int run data get storage large_number:math t1 1000
execute if score #temp2 int matches 1000000..9999999 store result score #temp1 int run data get storage large_number:math t1 100
scoreboard players set #temp3 int 0
execute if score #temp2 int matches 0..9 run scoreboard players set #temp3 int 8
execute if score #temp2 int matches 10..99 run scoreboard players set #temp3 int 7
execute if score #temp2 int matches 100..999 run scoreboard players set #temp3 int 6
execute if score #temp2 int matches 1000..9999 run scoreboard players set #temp3 int 5
execute if score #temp2 int matches 10000..99999 run scoreboard players set #temp3 int 4
execute if score #temp2 int matches 100000..999999 run scoreboard players set #temp3 int 3
execute if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp3 int 2

execute store result storage large_number:math temp1 int 1 run scoreboard players get #temp1 int
function large_number:float_multiply/macro2 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math t1 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #temp_expon2 int run function large_number:float_multiply/macro3 with storage large_number:math

#两指数相加，然后位移，最后整合输出
scoreboard players operation #temp_expon1 int += #temp_expon2 int
scoreboard players operation #temp_expon1 int += #temp_expon3 int
execute store result storage large_number:math temp2 int 1 run scoreboard players operation #temp_expon1 int -= #temp3 int
data modify storage large_number:math sstempd set value ""
execute unless score #is-.1 int = #is-.2 int run data modify storage large_number:math sstempd set value "-"
function large_number:float_multiply/macro5 with storage large_number:math
data modify storage large_number:math float_multiply.output set from storage large_number:math t3
