##10^12以内的数 加 10^12以内的数，以万进制输入，以万进制输出
# int是计算，const是常数

#输入第一个数：data modify storage large_number:math addition.input1 set value [I;0,0,0]
#输入第二个数：data modify storage large_number:math addition.input2 set value [I;0,0,0]
#输入规范：必须是三个万进制的整数，若数位为空则写0

#输出：data get storage large_number:math addition.output
#或：data get storage large_number:math addition
#读数规范：输出的列表每个数都是万进制数，若数位不足四位则向前补0

#相加
execute store result score #4.3 int run scoreboard players operation #1.3 int += #2.3 int
scoreboard players operation #1.2 int += #2.2 int
scoreboard players operation #1.1 int += #2.1 int

#进位
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #1.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #1.1 int += #4.2 int
data modify storage large_number:math addition.output set value [I;0,0,0,0]

scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #1.1 int %= 10000 const
scoreboard players operation #1.2 int %= 10000 const
scoreboard players operation #1.3 int %= 10000 const

execute if score #+- int matches 1 if score #4.1 int matches 1.. run scoreboard players operation #4.1 int *= -1 const
execute if score #+- int matches 1 unless score #4.1 int matches ..-1 if score #1.1 int matches 1.. run scoreboard players operation #1.1 int *= -1 const
execute if score #+- int matches 1 unless score #4.1 int matches ..-1 unless score #1.1 int matches ..-1 if score #1.2 int matches 1.. run scoreboard players operation #1.2 int *= -1 const
execute if score #+- int matches 1 unless score #4.1 int matches ..-1 unless score #1.1 int matches ..-1 unless score #1.2 int matches ..-1 if score #1.3 int matches 1.. run scoreboard players operation #1.3 int *= -1 const

#输出
execute store result storage large_number:math addition.output[0] int 1.0 run scoreboard players get #4.1 int
execute store result storage large_number:math addition.output[1] int 1.0 run scoreboard players get #1.1 int
execute store result storage large_number:math addition.output[2] int 1.0 run scoreboard players get #1.2 int
execute store result storage large_number:math addition.output[3] int 1.0 run scoreboard players get #1.3 int
